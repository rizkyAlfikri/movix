part of '../pages.dart';

class SuccessPage extends StatelessWidget {
  static const String ROUTE_NAME = '/success_page';
  final SuccessPageArgument successArgs;

  SuccessPage({@required this.successArgs});

  Future<void> _purchaseTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(successArgs.ticket.totalPrice));

    context.bloc<TicketBloc>().add(
        BuyTickets(successArgs.movixTransaction.userId, successArgs.ticket));

    await MovixTransactionServices.saveTransaction(
        successArgs.movixTransaction);
  }

  Future<void> _topUpWallet() {}

  @override
  Widget build(BuildContext context) {
    var isTicketNull = successArgs.ticket == null;

    return Scaffold(
      body: FutureBuilder(
          future:
              (isTicketNull) ? _topUpWallet() : _purchaseTicketOrder(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      margin: EdgeInsets.only(
                        left: 105.0,
                        right: 105.0,
                        bottom: 24.0,
                        top: 100.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(isTicketNull
                              ? 'assets/icon_success_topup.png'
                              : 'assets/icon_success_booking.png'),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    isTicketNull ? 'Congratulation' : 'Happy Watching',
                    style: blackTextFont.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 48.0),
                    child: Text(
                      isTicketNull
                          ? 'You have successfully\nTop Up My Wallet'
                          : 'You have successfully\nbought the ticket',
                      style: greyTextFont.copyWith(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  PrimaryButtonWidget(
                    width: getScreenSize(context).width - defaultMargin * 2,
                    buttonLabel: isTicketNull ? 'My Wallet' : 'My Tickets',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  PrimaryButtonWidget(
                    width: getScreenSize(context).width - defaultMargin * 2,
                    buttonColor: Color(0xFFC2C1D1),
                    labelColor: mainColor,
                    buttonLabel: 'Share',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discover new movie? ',
                        style: greyTextFont.copyWith(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Back to Home',
                        style: purpleTextFont.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class SuccessPageArgument {
  final Ticket ticket;
  final MovixTransaction movixTransaction;

  SuccessPageArgument(this.ticket, this.movixTransaction);
}
