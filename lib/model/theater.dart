part of 'model.dart';

class Theater extends Equatable {
  final String cinemaName;
  final List<String> cinemaTime;

  const Theater({this.cinemaName, this.cinemaTime});

  @override
  List<Object> get props => [this.cinemaName, this.cinemaTime];
}
