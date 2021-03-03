part of 'shimmer.dart';

class SimpleShimmer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double radius;

  SimpleShimmer(
      {this.child, this.height = 16.0, this.width = 48.0, this.radius = 4.0});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: child != null
          ? child
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius)),
            ),
    );
  }
}
