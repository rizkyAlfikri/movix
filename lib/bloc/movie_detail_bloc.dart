import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movix/model/model.dart';
import 'package:movix/services/services.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  @override
  MovieDetailState get initialState => MovieDetailInitial();

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    yield MovieDetailInitial();

    if (event is FetchMovieDetail) {
      var result = await MovieServices.getMovieDetail(event.movie);

      if (result.movieDetail != null) {
        yield MovieDetailLoaded(result.movieDetail);
      } else {
        yield MovieDetailError(result.errorMessage);
      }
    }
  }
}
