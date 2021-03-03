part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;

  MovieDetailLoaded(this.movieDetail);

  @override
  List<Object> get props => [this.movieDetail];
}

class MovieDetailError extends MovieDetailState {
  final String errorMessage;

  MovieDetailError(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
