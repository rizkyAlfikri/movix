part of '../pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationModel userData;

  SignUpPage(this.userData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData.name);
    _emailController = TextEditingController(text: widget.userData.email);
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkRegistrationFieldData() {
    if (!(_nameController.text.trim() != "" &&
        _emailController.text.trim() != "" &&
        _passwordController.text.trim() != "" &&
        _confirmPasswordController.text.trim() != "")) {
      showErrorMessage('Please fill all the fields', context);
    } else if (_passwordController.text.trim().length < 6) {
      showErrorMessage("Password's length min 6 characters", context);
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      showErrorMessage("Mismatch password and confirmed password", context);
    } else if (!EmailValidator.validate(_emailController.text.trim())) {
      showErrorMessage("Wrong formatted email address", context);
    } else {
      widget.userData.email = _emailController.text.trim();
      widget.userData.name = _nameController.text.trim();
      widget.userData.password = _passwordController.text.trim();
      if (widget.userData.selectedGenres != null) {
        widget.userData.selectedGenres = null;
        widget.userData.selectedLanguage = null;
      }
      context.bloc<PageBloc>().add(GoToPreferencePage(widget.userData));
    }
  }

  void _processPictureProfile() async {
    if (widget.userData.pictureFile == null) {
      widget.userData.pictureFile = await getImage();
    } else {
      widget.userData.pictureFile = null;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void _backToPreviousPage() {
      context.bloc<PageBloc>().add(GoToLoginPage());
    }

    return WillPopScope(
        onWillPop: () async {
          _backToPreviousPage();
          return;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(72.0),
                child: CustomAppBar(
                    'Create New\nYour Account', _backToPreviousPage)),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SignUpPictureProfileWidget(
                          widget.userData.pictureFile, _processPictureProfile),
                      CustomTextField(_nameController, 'Full Name'),
                      SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(_emailController, 'Email Address'),
                      SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(
                        _passwordController,
                        'Password',
                        isNeedObscuredText: true,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(
                        _confirmPasswordController,
                        'Confirm Password',
                        isNeedObscuredText: true,
                      ),
                      SizedBox(
                        height: 38.0,
                      ),
                      SignUpFooterWidget(_checkRegistrationFieldData),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
