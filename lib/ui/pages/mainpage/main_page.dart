part of '../pages.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController;
  MenuPositionController _menuPosisitionController;
  bool _isUserPageDrawing = false;

  @override
  void initState() {
    super.initState();
    _menuPosisitionController = MenuPositionController(initPosition: 0);
    pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    pageController.addListener(() {
      _menuPosisitionController.absolutePosition = pageController.page;
    });
  }

  @override
  void dispose() {
    pageController?.dispose();
    _menuPosisitionController?.dispose();
    super.dispose();
  }

  void _checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      _isUserPageDrawing = true;
    } else if (scrollNotification is ScrollEndNotification) {
      _isUserPageDrawing = false;
    }

    if (_isUserPageDrawing) {
      _menuPosisitionController.findNearestTarget(pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              color: backgroundColor,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  _checkUserDragging(scrollNotification);
                  return;
                },
                child: PageView(
                  controller: pageController,
                  children: [
                    HomePage(),
                    Text('My Tickets'),
                    RaisedButton(
                        onPressed: () {
                          AuthServices.signOut();
                        },
                        child: Text('Account')),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 56.0,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: BubbledNavigationBar(
                initialIndex: 0,
                controller: _menuPosisitionController,
                backgroundColor: Colors.white,
                defaultBubbleColor: Colors.white,
                onTap: (index) {
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuad);
                },
                items: [
                  BubbledNavigationBarItem(
                      icon: Icon(Icons.home,
                          size: defaultMargin, color: accentColor3),
                      activeIcon: Container(
                        width: defaultMargin,
                        height: defaultMargin,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: mainColor),
                        child: Icon(Icons.home, color: accentColor1, size: 18),
                      ),
                      title: Text('Home',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                              fontSize: 14.0))),
                  BubbledNavigationBarItem(
                      icon: Icon(Icons.local_activity,
                          size: defaultMargin, color: accentColor3),
                      activeIcon: Container(
                        width: defaultMargin,
                        height: defaultMargin,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: mainColor),
                        child: Icon(Icons.local_activity,
                            color: accentColor1, size: 18),
                      ),
                      title: Text('My Ticket',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                              fontSize: 14.0))),
                  BubbledNavigationBarItem(
                      icon: Icon(Icons.account_circle,
                          size: defaultMargin, color: accentColor3),
                      activeIcon: Container(
                        width: defaultMargin,
                        height: defaultMargin,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: mainColor),
                        child: Icon(Icons.account_circle,
                            color: accentColor1, size: 18),
                      ),
                      title: Text('Account',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                              fontSize: 14.0))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
