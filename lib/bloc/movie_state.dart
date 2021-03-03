part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  const MovieLoaded({this.movies});

  @override
  List<Object> get props => [this.movies];
}

class MovieError extends MovieState {
  final String errorMessage;

  const MovieError({this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}
