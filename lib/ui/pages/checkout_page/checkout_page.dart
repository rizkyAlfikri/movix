part of '../pages.dart';

class CheckoutPage extends StatefulWidget {
  static const String ROUTE_NAME = 'checkout_page';

  final Ticket ticket;

  const CheckoutPage({this.ticket});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconController;
  Animation<double> _animation;
  bool isShowDetail = false;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = Tween<double>(begin: math.pi, end: 0).animate(_iconController);
  }

  @override
  void dispose() {
    super.dispose();
    _iconController.dispose();
  }

  void _onTapBackArrowIcon() {
    Navigator.of(context).pop();
  }

  Widget _createCheckoutInfo({
    String label,
    String info,
    TextStyle labelTextStyle,
    TextStyle infoTextStyle,
    double bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: bottom ?? 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: labelTextStyle ?? greyTextFont.copyWith(fontSize: 16.0),
          ),
          Text(
            info,
            style: infoTextStyle ?? blackTextFont.copyWith(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72.0),
        child: CustomAppBar(
          'Preview Ticket',
          _onTapBackArrowIcon,
          backgroundColor: backgroundColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
              top: 8.0,
            ),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(2, 4))
            ]),
            child: Column(
              children: [
                Image.network(
                    IMAGE_URL_BASE_PATH +
                        IMAGE_MEDIUM_SIZE +
                        widget.ticket.movieDetail.backdropPath,
                    height: size.height * 0.182,
                    width: size.width,
                    fit: BoxFit.fill),
                Padding(
                  padding: EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                      top: 16.0,
                      bottom: 8.0),
                  child: Text(
                    widget.ticket.movieDetail.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: blackTextFont.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  widget.ticket.time.dateAndTime,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: blackNumberFont.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  child: Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                _createCheckoutInfo(
                    label: 'ID Order',
                    info: widget.ticket.bookingCode,
                    infoTextStyle: blackNumberFont.copyWith(fontSize: 16.0)),
                _createCheckoutInfo(
                    label: 'Theater', info: widget.ticket.theater.cinemaName),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: (isShowDetail)
                      ? Wrap(
                          children: [
                            _createCheckoutInfo(
                                label: 'Seats',
                                info: widget.ticket.seatsInString),
                            _createCheckoutInfo(
                                label: 'Price',
                                info: 'Rp.25000x${widget.ticket.seats.length}',
                                infoTextStyle:
                                    blackNumberFont.copyWith(fontSize: 16.0)),
                            _createCheckoutInfo(
                                label: 'Fees',
                                info: 'Rp.2000x${widget.ticket.seats.length}',
                                infoTextStyle:
                                    blackNumberFont.copyWith(fontSize: 16.0)),
                          ],
                        )
                      : SizedBox(),
                ),
                _createCheckoutInfo(
                    label: 'Total',
                    labelTextStyle: blackTextFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                    info: 'Rp.${widget.ticket.totalPrice.toString()}',
                    infoTextStyle: blackNumberFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 12.0),
                  child: Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (userState is UserLoaded) {
                      return _createCheckoutInfo(
                        bottom: 0,
                        label: 'Saldo Wallet',
                        labelTextStyle: blackTextFont.copyWith(
                            color: userState.user.balance >=
                                    widget.ticket.totalPrice
                                ? safeColor
                                : dangernColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        info: 'Rp.${userState.user.balance}',
                        infoTextStyle: blackNumberFont.copyWith(
                            color: userState.user.balance >=
                                    widget.ticket.totalPrice
                                ? safeColor
                                : dangernColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SimpleShimmer(
                            width: defaultMargin * 4,
                          ),
                          SimpleShimmer(
                            width: defaultMargin * 6,
                          )
                        ],
                      );
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, widget) => Transform.rotate(
                      angle: _animation.value,
                      child: GestureDetector(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 36.0,
                        ),
                        onTap: () {
                          if (isShowDetail) {
                            _iconController.reverse();
                          } else {
                            _iconController.forward();
                          }

                          setState(() {
                            isShowDetail = !isShowDetail;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: defaultMargin),
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserLoaded) {
                  return PrimaryButtonWidget(
                      width: size.width - defaultMargin * 2,
                      buttonColor:
                          userState.user.balance >= widget.ticket.totalPrice
                              ? safeColor
                              : mainColor,
                      buttonLabel:
                          userState.user.balance >= widget.ticket.totalPrice
                              ? 'Checkout Now'
                              : 'Top Up Now');
                } else {
                  return PrimaryButtonWidget(
                      width: size.width - defaultMargin * 2,
                      isEnable: false,
                      buttonLabel: 'Checkout Now');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
