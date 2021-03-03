part of 'widget.dart';

class DateCardWidget extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function(DateTime) onTap;
  final int index;
  final int dataLength;
  final double paddingLeft;
  final double paddingRight;

  DateCardWidget({
    this.isSelected = false,
    this.width = 70.0,
    this.height = 85.0,
    this.date,
    this.onTap,
    this.index,
    this.dataLength,
    this.paddingLeft = defaultMargin,
    this.paddingRight = defaultMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: (index == null)
            ? paddingLeft
            : (index == 0)
                ? paddingLeft
                : 0,
        right: (index == null || dataLength == null)
            ? paddingRight
            : (index >= dataLength)
                ? paddingRight
                : 16.0,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border:
            Border.all(color: (isSelected) ? Colors.transparent : accentColor4),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        color: (isSelected) ? accentColor1 : Colors.white,
        child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(date);
              }
            },
            splashColor: Colors.yellowAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.sortDayTime,
                  style: blackTextFont.copyWith(fontSize: 16.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  date.day.toString(),
                  style: blackNumberFont.copyWith(fontSize: 16.0),
                ),
              ],
            )),
      ),
    );
  }
}
