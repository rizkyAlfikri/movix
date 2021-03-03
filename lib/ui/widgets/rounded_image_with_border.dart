part of 'widget.dart';

class RoundedImageWithBorder extends StatelessWidget {
  final String imagePath;
  final IconData icons;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final double padding;
  final double size;
  final Color splashColor;

  RoundedImageWithBorder(this.imagePath,
      {this.icons,
      this.iconColor = dangernColor,
      this.borderColor = accentColor4,
      this.padding = 12.0,
      this.size = 48.0,
      this.backgroundColor = Colors.white,
      this.splashColor = dangernColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: borderColor)),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: splashColor.withOpacity(0.5),
            child: Center(
              child: (imagePath.isNotEmpty || icons == null)
                  ? Image.asset(
                      imagePath,
                    )
                  : Icon(
                      icons,
                      color: iconColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
