part of 'theater_bloc.dart';

abstract class TheaterState extends Equatable {
  const TheaterState();

  @override
  List<Object> get props => [];
}

class TheaterInitial extends TheaterState {}

class TheaterLoaded extends TheaterState {
  final List<Theater> theaters;

  TheaterLoaded(this.theaters);

  @override
  List<Object> get props => [this.theaters];
}

class TheaterError extends TheaterState {
  final String errorMessage;

  TheaterError(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
