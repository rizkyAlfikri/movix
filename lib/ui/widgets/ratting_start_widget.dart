part of 'widget.dart';

class RattingStartWidget extends StatelessWidget {
  final double voteAverage;
  final double startSize;
  final double fontSize;
  final int totalStart;
  final bool isWhiteText;
  final bool isTextBold;
  final MainAxisAlignment mainAxisAlignment;

  RattingStartWidget(
      {this.voteAverage = 0.0,
      this.startSize = 14.0,
      this.fontSize = 12.0,
      this.totalStart = 5,
      this.isWhiteText = true,
      this.isTextBold = false,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        totalStart,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor1,
              size: startSize,
            ));

    widgets.add(SizedBox(
      width: 4.0,
    ));

    widgets.add(
      Text(
        '$voteAverage / 10',
        style: isWhiteText
            ? whiteNumberFont.copyWith(
                fontWeight: isTextBold ? FontWeight.w600 : FontWeight.w300,
                fontSize: fontSize)
            : blackNumberFont.copyWith(
                fontWeight: isTextBold ? FontWeight.w600 : FontWeight.w300,
                fontSize: fontSize),
      ),
    );

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }
}
