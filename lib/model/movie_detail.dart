part of 'model.dart';

class MovieDetail extends Movie {
  final String status;
  final String duration;
  final String releaseDate;
  final String tag;
  final List<String> genres;
  final String language;

  MovieDetail(Movie movie,
      {this.language,
      this.status,
      this.duration,
      this.releaseDate,
      this.tag,
      this.genres})
      : super(
            title: movie.title,
            id: movie.id,
            overview: movie.overview,
            backdropPath: movie.backdropPath,
            posterPath: movie.posterPath,
            voteAverage: movie.voteAverage);

  @override
  List<Object> get props =>
      super.props +
      [
        this.language,
        this.status,
        this.duration,
        this.releaseDate,
        this.tag,
        this.genres
      ];
}
