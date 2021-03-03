part of 'widget.dart';

class CommingSoonCardWidget extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie, BuildContext) onTap;

  CommingSoonCardWidget({
    @required this.movies,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          return Padding(
            padding: EdgeInsets.only(
              left: (movie == movies.first) ? defaultMargin : 0.0,
              right: (movie == movies.last) ? defaultMargin : 16.0,
            ),
            child: Hero(
              tag: movie.id,
              child: Container(
                height: 140.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(IMAGE_URL_BASE_PATH +
                          IMAGE_MEDIUM_SIZE +
                          movie.posterPath)),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    splashColor: secondaryColor.withOpacity(0.5),
                    onTap: () {
                      if (onTap != null) {
                        onTap(movie, context);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
