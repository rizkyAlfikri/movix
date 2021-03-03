part of 'credit_bloc.dart';

abstract class CreditState extends Equatable {
  const CreditState();

  @override
  List<Object> get props => [];
}

class CreditInitial extends CreditState {}

class CreditLoaded extends CreditState {
  final List<Credit> credits;

  CreditLoaded(this.credits);

  @override
  List<Object> get props => [this.credits];
}

class CreditError extends CreditState {
  final String errorMessage;

  CreditError(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
