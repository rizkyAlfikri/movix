part of 'shimmer.dart';

class ShimmerMovieCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final double paddingLeft;
  final double paddingRight;
  final int dataLength;
  final MainAxisAlignment mainAxisAlignment;

  ShimmerMovieCardWidget(
      {this.width = 210.0,
      this.height = 140.0,
      this.paddingLeft = defaultMargin,
      this.paddingRight = defaultMargin,
      this.dataLength = 4,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        dataLength,
        (index) => Padding(
          padding: EdgeInsets.only(
              left: (index == 0) ? paddingLeft : 0,
              right: (index >= dataLength - 1) ? paddingRight : 16.0),
          child: SimpleShimmer(
            child: null,
            width: width,
            height: height,
            radius: 8.0,
          ),
        ),
      ),
    );
  }
}
