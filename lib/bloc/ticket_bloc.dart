import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movix/model/model.dart';
import 'package:movix/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  @override
  TicketState get initialState => TicketInitial();

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTickets) {
      var isSuccess =
          await TicketService.saveTicket(event.userId, event.ticket);

      if (isSuccess) {
        if (state is TicketLoaded) {
          List<Ticket> tickets =
              (state as TicketLoaded).tickets + [event.ticket];
          yield TicketLoaded(tickets);
        }
      } else {
        yield TicketError('System Busy');
      }
    } else if (event is GetTickets) {
      yield TicketInitial();

      var result = await TicketService.getTickets(event.userId);

      yield result.fold((errorMessage) => TicketError(errorMessage),
          (tickets) => TicketLoaded(tickets));
    }
  }
}
