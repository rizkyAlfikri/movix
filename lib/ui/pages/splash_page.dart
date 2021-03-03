part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool state = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2500)).then((_) {
      setState(() {
        state = true;
      });
      executeLoginSession(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: (size.height * 1 / 5), bottom: 45.0),
              padding: EdgeInsets.all(20.0),
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/icon_movix.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                'New Experience',
                style: whiteTextFont.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 20.0),
              ),
            ),
            AnimatedCrossFade(
              crossFadeState:
                  state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 1500),
              firstCurve: Curves.decelerate,
              firstChild: Container(
                  width: size.width,
                  margin: EdgeInsets.only(bottom: 100),
                  child: createTextLabel(
                    'Watch new movie\nmuch easier than any before',
                  )),
              secondCurve: Curves.easeOut,
              secondChild: Container(
                  width: size.width,
                  margin: EdgeInsets.only(bottom: 16),
                  child: createTextLabel(
                    'with',
                  )),
            ),
            Text(
              'MOVIX',
              style: yellowTextFont.copyWith(
                  fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'v.1.0.0',
                style: whiteNumberFont.copyWith(
                    fontSize: 16.0, fontWeight: FontWeight.w300),
              ),
            )
          ],
        )));
  }

  Widget createTextLabel(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          whiteTextFont.copyWith(fontWeight: FontWeight.w300, fontSize: 16.0),
    );
  }

  Future<void> executeLoginSession(BuildContext context) {
    return Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Wrapper()), (route) => false);
    });
  }
}
