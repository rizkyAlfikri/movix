part of '../pages.dart';

class SelectSeatPage extends StatefulWidget {
  static const String ROUTE_NAME = 'select_seat_page';

  final Ticket ticket;

  const SelectSeatPage({this.ticket});

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  void _movieToCheckoutPage(List<String> seats) {
    int price = 25000 * seats.length;
    int fees = 2000 * seats.length;
    int total = price + fees;
    Ticket ticket = widget.ticket.copyWith(seats: seats, totalPrice: total);
    Navigator.of(context).pushNamed(CheckoutPage.ROUTE_NAME, arguments: ticket);
  }

  void _onTapBackArrowIcon() {
    Navigator.of(context).pop();
  }

  Widget generateSeatsWidget() {
    List<int> listSeat = [4, 6, 6, 6, 6];
    List<Widget> widgetSeats = [];

    for (int i = 0; i < listSeat.length; i++) {
      List<Widget> widgets = [];
      List.generate(listSeat[i], (index) {
        var widget = Padding(
          padding: EdgeInsets.only(
              bottom: (i == listSeat.length - 1) ? 0 : 16.0,
              right: (index != (listSeat[i] / 2) - 1) ? 16.0 : 0),
          child: SelectableBoxWidget(
            '${String.fromCharCode(65 + i)}${index + 1}',
            textStyle: blackNumberFont.copyWith(
              fontSize: 14.0,
            ),
            isSelected: (selectedSeats
                .contains('${String.fromCharCode(65 + i)}${index + 1}')),
            isEnabled: (i != 2 && i != listSeat.length - 1 && i != 3 ||
                index == 0 ||
                index == listSeat[i] - 1),
            width: 32.0,
            height: 32.0,
            onTap: () {
              var seatNumber = '${String.fromCharCode(65 + i)}${index + 1}';
              setState(() {
                if (selectedSeats.contains(seatNumber)) {
                  selectedSeats.remove(seatNumber);
                } else {
                  selectedSeats.add(seatNumber);
                }
              });
            },
          ),
        );
        if (listSeat[i] == listSeat.first) {
          if (index == 0) {
            widgets.add(Spacer());
            widgets.add(widget);
          } else if (index == listSeat.first - 1 ||
              index == (listSeat[i] / 2) - 1) {
            widgets.add(widget);
            widgets.add(Spacer());
          } else {
            widgets.add(widget);
          }
        } else if (index == (listSeat[i] / 2) - 1) {
          widgets.add(widget);
          widgets.add(Spacer());
        } else {
          widgets.add(widget);
        }
      });

      widgetSeats.add(
          Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets));
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: widgetSeats));
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: CustomAppBar(
            widget.ticket.movieDetail.title,
            _onTapBackArrowIcon,
          ),
          preferredSize: Size.fromHeight(72.0)),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8.0),
            child: Hero(
              tag: widget.ticket.movieDetail.id,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateX(0.6),
                alignment: FractionalOffset.center,
                child: Image.network(
                  IMAGE_URL_BASE_PATH +
                      IMAGE_MEDIUM_SIZE +
                      widget.ticket.movieDetail.backdropPath,
                  fit: BoxFit.fill,
                  width: size.width * 0.68,
                  height: size.height * 0.13,
                ),
              ),
            ),
          ),
          Spacer(),
          generateSeatsWidget(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  children: [
                    SelectableBoxWidget(
                      '',
                      width: 24.0,
                      height: 24.0,
                      onTap: null,
                    ),
                    Text(
                      'Available',
                      style: blackTextFont.copyWith(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  children: [
                    SelectableBoxWidget(
                      '',
                      isEnabled: false,
                      width: 24.0,
                      height: 24.0,
                      onTap: null,
                    ),
                    Text(
                      'Booked',
                      style: blackTextFont.copyWith(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  children: [
                    SelectableBoxWidget(
                      '',
                      isSelected: true,
                      width: 24.0,
                      height: 24.0,
                      onTap: null,
                    ),
                    Text(
                      'Selected',
                      style: blackTextFont.copyWith(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          PrimaryButtonWidget(
            buttonLabel: 'Create Ticket',
            width: size.width - defaultMargin * 2,
            isEnable: (selectedSeats.isNotEmpty),
            onTap: () {
              _movieToCheckoutPage(selectedSeats);
            },
          ),
          SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }
}
