part of 'ticket_bloc.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoaded extends TicketState {
  final List<Ticket> tickets;

  const TicketLoaded(this.tickets);

  @override
  List<Object> get props => [this.tickets];
}

class TicketError extends TicketState {
  final String errorMessage;

  TicketError(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
