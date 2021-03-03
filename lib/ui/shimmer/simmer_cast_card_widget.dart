part of 'shimmer.dart';

class ShimmerCastCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.only(left: defaultMargin),
            child: SimpleShimmer(
              height: 80.0,
              width: 70.0,
              radius: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SimpleShimmer(
              height: 80.0,
              width: 70.0,
              radius: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SimpleShimmer(
              height: 80.0,
              width: 70.0,
              radius: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SimpleShimmer(
              height: 80.0,
              width: 70.0,
              radius: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: defaultMargin),
            child: SimpleShimmer(
              height: 80.0,
              width: 70.0,
              radius: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
