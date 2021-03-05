part of 'model.dart';

class MovixTransaction extends Equatable {
  final String userId;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime time;
  final String picture;

  MovixTransaction({
    @required this.userId,
    @required this.title,
    @required this.subtitle,
    this.amount = 0,
    @required this.time,
    this.picture,
  });

  @override
  List<Object> get props => [
        this.userId,
        this.title,
        this.subtitle,
        this.amount,
        this.time,
        this.picture,
      ];
}
