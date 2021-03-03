part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    if (user == null) {
      if (!(prevPageEvent is OnLoginPage)) {
        prevPageEvent = GoToLoginPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is OnMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(user.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (context, pageState) {
        if (pageState is OnLoginPage) {
          return SignInPage();
        } else if (pageState is OnRegistrationPage) {
          return SignUpPage(pageState.registrationModel);
        } else if (pageState is OnPreferencePage) {
          return PreferencePage(pageState.registrationModel);
        } else if (pageState is OnAccountConfirmationPage) {
          return AccountConfirmationPage(pageState.registrationModel);
        } else {
          return MainPage();
        }
      },
    );
  }
}
