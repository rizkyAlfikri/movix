part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isSignInValid = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: secondaryColor)));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 1 / 13,
                ),
                Image.asset(
                  'assets/icon_mini_moxi2.png',
                  width: 72.0,
                  height: 72.0,
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  'Welcome Back\nExplorer',
                  style: blackTextFont.copyWith(
                      fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 36.0,
                ),
                SizedBox(
                  height: 45.0,
                  child: TextField(
                      onChanged: (text) {
                        setState(() {
                          _isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: _emailController,
                      decoration: getCustomInputDecoration('Email Address')),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 45.0,
                  child: TextField(
                      onChanged: (text) {
                        setState(() {
                          _isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: getCustomInputDecoration('Password')),
                ),
                SizedBox(
                  height: 36.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: blackTextFont.copyWith(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    (_isSignInValid)
                        ? SpinKitFadingCircle(
                            size: 48.0,
                            color: mainColor,
                          )
                        : Container(
                            width: 48.0,
                            height: 48.0,
                            child: FloatingActionButton(
                              elevation: 0.0,
                              backgroundColor:
                                  (_isEmailValid && _isPasswordValid)
                                      ? mainColor
                                      : accentColor4,
                              onPressed: (_isEmailValid && _isPasswordValid)
                                  ? () async {
                                      setState(() {
                                        _isSignInValid = true;
                                      });

                                      SignInSignUpResult result =
                                          await AuthServices.signInWithEmail(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);

                                      if (result.user == null) {
                                        setState(() {
                                          _isSignInValid = false;
                                        });

                                        showErrorMessage(
                                            result.message, context);
                                      }
                                    }
                                  : null,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 24.0,
                                color: (_isEmailValid && _isPasswordValid)
                                    ? Colors.white
                                    : accentColor3,
                              ),
                            ),
                          )
                  ],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedImageWithBorder('assets/icon_google.png'),
                    RoundedImageWithBorder('assets/icon_facebook.png'),
                    RoundedImageWithBorder('assets/icon_apple.png'),
                  ],
                ),
                SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToRegistrationPage(RegistrationModel()));
                      },
                      child: Text(
                        'Sign Up',
                        style: blackTextFont.copyWith(
                            fontSize: 14.0,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'Forgot Password ?',
                      style: blackTextFont.copyWith(
                          fontSize: 14.0,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
