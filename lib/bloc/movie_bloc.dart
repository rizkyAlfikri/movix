import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movix/model/model.dart';
import 'package:movix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    print(" movie event  loaded ${event is FetchMovie}");
    if (event is FetchMovie) {
      var movies = await MovieServices.getMovies(1);
      yield (movies.movies != null)
          ? MovieLoaded(movies: movies.movies)
          : MovieError(errorMessage: movies.errorMessage);
    }
  }
}
