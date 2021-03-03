part of 'widget.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final int index;
  final int dataLength;
  final double paddingLeft;
  final double paddingRight;

  MovieCardWidget(
    this.movie,
    this.index,
    this.dataLength, {
    this.paddingLeft = defaultMargin,
    this.paddingRight = defaultMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id,
      child: Container(
        margin: EdgeInsets.only(
            left: (index == null)
                ? paddingLeft
                : (index == 0)
                    ? paddingLeft
                    : 0,
            right: (index == null && dataLength == null)
                ? paddingRight
                : index == dataLength
                    ? paddingRight
                    : 16.0),
        height: 140.0,
        width: 210.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(IMAGE_URL_BASE_PATH +
                    IMAGE_MEDIUM_SIZE +
                    movie.backdropPath))),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            splashColor: secondaryColor.withOpacity(0.5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 50,
                    width: 210,
                    padding: EdgeInsets.only(left: 12.0, top: 8.0),
                    color: Colors.white.withOpacity(0.4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextFont.copyWith(fontSize: 14.0),
                        ),
                        RattingStartWidget(voteAverage: movie.voteAverage)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
