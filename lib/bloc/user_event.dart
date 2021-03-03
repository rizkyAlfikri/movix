part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);
  @override
  List<Object> get props => [id];
}

class RefreshUser extends UserEvent {
  @override
  List<Object> get props => [];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

class UpdateUserData extends UserEvent {
  final String name;
  final String profileImage;

  UpdateUserData({this.name, this.profileImage});

  List<Object> get props => [this.name, this.profileImage];
}
