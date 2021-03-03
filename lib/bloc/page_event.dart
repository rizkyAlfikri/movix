part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSpashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationModel registrationModel;

  const GoToRegistrationPage(this.registrationModel);

  @override
  List<Object> get props => [this.registrationModel];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationModel registrationModel;

  const GoToPreferencePage(this.registrationModel);

  @override
  List<Object> get props => [this.registrationModel];
}

class GoToAccountConfirmartionPage extends PageEvent {
  final RegistrationModel registrationModel;

  const GoToAccountConfirmartionPage(this.registrationModel);

  @override
  List<Object> get props => [this.registrationModel];
}
