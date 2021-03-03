part of 'widget.dart';

class CastCardWidget extends StatelessWidget {
  final Credit credit;
  final double paddingRight;
  final double paddingLeft;
  final int index;
  final int dataLength;
  CastCardWidget(this.credit,
      {this.paddingLeft = 0.0,
      this.paddingRight = 0.0,
      this.index,
      this.dataLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: (index == null)
            ? paddingLeft
            : (index == 0)
                ? defaultMargin
                : 0.0,
        right: (index == null)
            ? paddingRight
            : (index == dataLength)
                ? defaultMargin
                : 16.0,
      ),
      child: Column(
        children: [
          (credit.profilePath != null)
              ? Container(
                  height: 80.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(IMAGE_URL_BASE_PATH +
                              IMAGE_MEDIUM_SIZE +
                              credit.profilePath))),
                )
              : Container(
                  height: 80.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: accentColor4,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Icon(
                    Icons.person,
                    color: accentColor3,
                    size: 70.0,
                  ),
                ),
          SizedBox(height: 4.0),
          SizedBox(
            width: 70.0,
            child: Text(
              credit.name,
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
