part of '../pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationModel registrationModel;

  const AccountConfirmationPage(this.registrationModel);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  Status status = Status.none;

  @override
  Widget build(BuildContext context) {
    var pictureSize = getScreenSize(context).width * 30 / 100;

    void _backToPreviousPage() {
      context
          .bloc<PageBloc>()
          .add(GoToPreferencePage(widget.registrationModel));
    }

    void _moveToMainPage() {
      Future.delayed(Duration(seconds: 3)).then((_) {
        context.bloc<PageBloc>().add(GoToMainPage());
      });
    }

    void onTap() async {
      setState(() {
        status = Status.loading;
      });

      SignInSignUpResult result = await AuthServices.signUp(
          email: widget.registrationModel.email,
          name: widget.registrationModel.name,
          password: widget.registrationModel.password,
          selectedGenres: widget.registrationModel.selectedGenres,
          selectedLanguage: widget.registrationModel.selectedLanguage);

      if (result.user == null) {
        setState(() {
          status = Status.none;
        });
        showErrorMessage(result.message, context);
      } else {
        pictureFileToUpload = widget.registrationModel.pictureFile;
        Future.delayed(Duration(seconds: 2)).then((_) {
          setState(() {
            status = Status.completed;
            _moveToMainPage();
          });
        });
      }
    }

    return WillPopScope(
      onWillPop: () async {
        _backToPreviousPage();
        return;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72.0),
          child: CustomAppBar('Confirm\nNew Account', _backToPreviousPage),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 56.0,
                ),
                Container(
                  height: pictureSize,
                  width: pictureSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (widget.registrationModel.pictureFile == null)
                              ? AssetImage('assets/icon_empty_avatar.png')
                              : FileImage(
                                  widget.registrationModel.pictureFile))),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Welcome',
                  style: blackTextFont.copyWith(
                      fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  widget.registrationModel.name,
                  style: blackTextFont.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
                SizedBox(
                  height: 72.0,
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: (status == Status.none)
                      ? PrimaryButtonWidget(
                          buttonLabel: 'Create New Account',
                          onTap: onTap,
                          width:
                              getScreenSize(context).width - defaultMargin * 4,
                        )
                      : (status == Status.error)
                          ? SpinKitFadingCircle(size: 48.0, color: mainColor)
                          : SizedBox(
                              width: 48.0,
                              height: 48.0,
                              child: Image(
                                  image: AssetImage('assets/icon_success.png')),
                            ),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      child: child,
                      opacity: animation,
                    );
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
