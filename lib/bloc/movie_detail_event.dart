part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetail extends MovieDetailEvent {
  final Movie movie;

  FetchMovieDetail(this.movie);

  @override
  List<Object> get props => [this.movie];
}
