part of 'services.dart';

class MovieServices {
  static Future<MovieResult> getMovies(int page, {http.Client client}) async {
    try {
      String url =
          '${BASE_URL}discover/movie?api_key=$API_KEY&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page';

      client ??= http.Client();

      var response = await client.get(url);
      print('result movie code ${response.statusCode}');
      if (response.statusCode != 200) {
        return MovieResult(null, 'System Busy');
      }

      var data = json.decode(response.body);
      List result = data['results'];
      print('result movie ${result.length}');
      return MovieResult(
          result.map((data) => Movie.fromJson(data)).toList(), "");
    } catch (e) {
      print('Error Message $e');
      return MovieResult(null, 'System Busy');
    }
  }

  static Future<MovieDetailResult> getMovieDetail(Movie movie,
      {http.Client client}) async {
    try {
      String url =
          '${BASE_URL}movie/${movie.id}?api_key=$API_KEY&language=en-US';

      client ??= http.Client();

      var response = await client.get(url);
      if (response.statusCode != 200) {
        return MovieDetailResult(null, 'System Busy ${response.statusCode}');
      }
      var data = json.decode(response.body);

      List genres = (data as Map<String, dynamic>)['genres'];
      String duration = (data as Map<String, dynamic>)['runtime'].toString();
      String releaseDate = (data as Map<String, dynamic>)['release_date'];
      String status = (data as Map<String, dynamic>)['status'];
      String tag = (data as Map<String, dynamic>)['tagline'];
      String language;

      switch ((data as Map<String, dynamic>)['original_language'].toString()) {
        case 'ja':
          language = 'Japanese';
          break;
        case 'id':
          language = 'Indonesian';
          break;
        case 'ko':
          language = 'Korean';
          break;
        default:
          language = 'English';
          break;
      }

      return MovieDetailResult(
          MovieDetail(movie,
              duration: duration,
              language: language,
              releaseDate: releaseDate,
              status: status,
              tag: tag,
              genres: genres
                  .map((e) => (e as Map<String, dynamic>)['name'].toString())
                  .toList()),
          "");
    } catch (e) {
      return MovieDetailResult(null, 'System Busy');
    }
  }

  static Future<Either<String, List<Credit>>> getCredit(String movieId,
      {http.Client client}) async {
    try {
      String url = '${BASE_URL}movie/$movieId/credits?api_key=$API_KEY';

      client ??= http.Client();

      var response = await client.get(url);

      var data = json.decode(response.body);
      List<Credit> credits = ((data as Map<String, dynamic>)['cast'] as List)
          .map((credit) => Credit(
              name: (credit as Map<String, dynamic>)['name'],
              profilePath: (credit as Map<String, dynamic>)['profile_path']))
          .take(8)
          .toList();

      return Right(credits);
    } catch (e) {
      return Left('$e');
    }
  }
}

class MovieResult {
  final List<Movie> movies;
  final String errorMessage;
  MovieResult(this.movies, this.errorMessage);
}

class MovieDetailResult {
  final MovieDetail movieDetail;
  final String errorMessage;
  MovieDetailResult(this.movieDetail, this.errorMessage);
}
