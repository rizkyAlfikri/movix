import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movix/model/model.dart';
import 'package:movix/services/services.dart';

part 'credit_event.dart';
part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  @override
  CreditState get initialState => CreditInitial();

  @override
  Stream<CreditState> mapEventToState(
    CreditEvent event,
  ) async* {
    yield CreditInitial();

    try {
      if (event is FetchCredit) {
        var result = await MovieServices.getCredit(event.movieId);

        yield result.fold(
            (error) => CreditError(error), (data) => CreditLoaded(data));
      }
    } catch (e) {
      yield CreditError("$e");
    }
  }
}
