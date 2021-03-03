part of 'credit_bloc.dart';

abstract class CreditEvent extends Equatable {
  const CreditEvent();

  @override
  List<Object> get props => [];
}

class FetchCredit extends CreditEvent {
  final String movieId;

  FetchCredit(this.movieId);

  @override
  List<Object> get props => [movieId];
}
