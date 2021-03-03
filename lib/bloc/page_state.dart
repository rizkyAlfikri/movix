part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationModel registrationModel;

  const OnRegistrationPage(this.registrationModel);
  @override
  List<Object> get props => [this.registrationModel];
}

class OnPreferencePage extends PageState {
  final RegistrationModel registrationModel;

  const OnPreferencePage(this.registrationModel);
  @override
  List<Object> get props => [this.registrationModel];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationModel registrationModel;

  const OnAccountConfirmationPage(this.registrationModel);
  @override
  List<Object> get props => [this.registrationModel];
}
