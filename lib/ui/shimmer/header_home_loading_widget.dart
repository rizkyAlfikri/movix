part of 'shimmer.dart';

class HeaderHomeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = getScreenSize(context).width;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SimpleShimmer(
              child: Container(
                width: 48.0,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleShimmer(width: width / 2),
                SizedBox(
                  height: 4.0,
                ),
                SimpleShimmer(width: width / 3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
