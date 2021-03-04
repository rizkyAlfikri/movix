part of '../pages.dart';

class CheckoutClipper extends CustomClipper<Path> {
  final double imageHeight;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double clipSize;

  CheckoutClipper(
    this.imageHeight,
    this.marginTop,
    this.marginRight,
    this.marginLeft,
    this.clipSize,
  );

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(marginLeft - 2, imageHeight - clipSize + marginTop - 2);

    path.quadraticBezierTo(
      clipSize + marginLeft - 2,
      imageHeight - clipSize + marginTop,
      clipSize + marginLeft - 2,
      imageHeight + marginTop,
    );

    path.quadraticBezierTo(
      clipSize + marginLeft - 2,
      imageHeight + clipSize + marginTop,
      marginLeft - 2,
      imageHeight + clipSize + marginTop + 2,
    );

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(
      size.width - marginRight - 2,
      imageHeight + clipSize + marginTop + 2,
    );

    path.quadraticBezierTo(
      size.width - clipSize - marginRight - 2,
      imageHeight + clipSize + marginTop,
      size.width - clipSize - marginRight - 2,
      imageHeight + marginTop,
    );
    path.quadraticBezierTo(
      size.width - clipSize - marginRight - 2,
      imageHeight - clipSize + marginTop,
      size.width - marginRight - 2,
      imageHeight - clipSize + marginTop - 2,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
