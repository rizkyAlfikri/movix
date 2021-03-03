part of '../pages.dart';

class MovieDetailAdditionalInfo extends StatelessWidget {
  final MovieDetail movieDetail;

  MovieDetailAdditionalInfo(this.movieDetail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 140.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(IMAGE_URL_BASE_PATH +
                    IMAGE_MEDIUM_SIZE +
                    movieDetail.posterPath),
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieAdditionalInfoWidget('Title', movieDetail.title),
                MovieAdditionalInfoWidget('Genre', 'Action, Horror, War'),
                MovieAdditionalInfoWidget(
                  'Duration',
                  movieDetail.duration,
                ),
                MovieAdditionalInfoWidget('Status', movieDetail.status),
                MovieAdditionalInfoWidget(
                  'Released Date',
                  movieDetail.releaseDate,
                  isNumberText: true,
                ),
                MovieAdditionalInfoWidget(
                  'Ratting',
                  '',
                  padding: 0.0,
                  child: RattingStartWidget(
                    startSize: 16.0,
                    fontSize: 13.0,
                    totalStart: 1,
                    isWhiteText: false,
                    isTextBold: true,
                    mainAxisAlignment: MainAxisAlignment.start,
                    voteAverage: movieDetail.voteAverage,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
