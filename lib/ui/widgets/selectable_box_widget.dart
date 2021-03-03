part of 'widget.dart';

class SelectableBoxWidget extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBoxWidget(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.width = 144.0,
      this.height = 80.0,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
            color: (!isEnabled)
                ? accentColor3
                : (isSelected)
                    ? Colors.transparent
                    : accentColor3),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        color: (!isEnabled)
            ? accentColor3
            : (isSelected)
                ? accentColor1
                : Colors.white,
        child: InkWell(
          onTap: (onTap != null && isEnabled) ? onTap : null,
          splashColor: (!isEnabled) ? Colors.transparent : Colors.yellowAccent,
          child: Center(
            child: Text(
              text ?? "None",
              style: textStyle ??
                  blackTextFont.copyWith(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
