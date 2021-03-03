part of 'widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final Function onTap;
  final double width;
  final double height;
  final bool isEnable;

  PrimaryButtonWidget({
    this.buttonLabel,
    this.onTap,
    this.width = 100.0,
    this.height = 48.0,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainColor,
      elevation: 8,
      shadowColor: (isEnable)
          ? mainColor.withOpacity(0.25)
          : accentColor4.withOpacity(0.25),
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: (isEnable)
                  ? mainColor.withOpacity(0.25)
                  : accentColor4.withOpacity(0.25),
              offset: Offset(3.0, 3.0),
              blurRadius: 4.0)
        ], borderRadius: BorderRadius.circular(4.0), color: mainColor),
        child: Material(
          color: (isEnable) ? mainColor : accentColor4,
          borderRadius: BorderRadius.circular(4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(4.0),
            splashColor: secondaryColor,
            onTap: (isEnable) ? onTap : null,
            child: Center(
              child: Text(
                buttonLabel,
                style: whiteTextFont.copyWith(
                    color: (isEnable) ? Colors.white : accentColor3,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
