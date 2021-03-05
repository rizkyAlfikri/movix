part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class GetTickets extends TicketEvent {
  final String userId;

  GetTickets(this.userId);

  @override
  List<Object> get props => [this.userId];
}

class BuyTickets extends TicketEvent {
  final Ticket ticket;
  final String userId;

  BuyTickets(this.userId, this.ticket);

  @override
  List<Object> get props => [this.userId, this.ticket];
}
