import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movix/model/model.dart';
import 'package:movix/services/services.dart';

part 'theater_event.dart';
part 'theater_state.dart';

class TheaterBloc extends Bloc<TheaterEvent, TheaterState> {
  @override
  TheaterState get initialState => TheaterInitial();
  @override
  Stream<TheaterState> mapEventToState(
    TheaterEvent event,
  ) async* {
    yield TheaterInitial();

    if (event is FetchTheater) {
      var result = await TheaterService.getTheater();

      yield result.fold((errorMessage) => TheaterError(errorMessage),
          (datas) => TheaterLoaded(datas));
    }
  }
}
