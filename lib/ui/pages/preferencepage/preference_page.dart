part of '../pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationModel registrationModel;

  PreferencePage(this.registrationModel);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> genres = [
    'Action',
    'Romance',
    'Crime',
    'Fantasy',
    'Comedy',
    'Horor'
  ];

  List<String> languages = ['English', 'Bahasa', 'Japanese', 'Korean'];

  List<String> selectedGenres = [];
  String selectedLanguages = 'English';
  bool isPreferenceCompleted = false;

  List<Widget> _generateSelectableGenreBox(BuildContext context) {
    var width = getScreenSize(context).width - 3 * defaultMargin;
    return genres
        .map((genre) => SelectableBoxWidget(
              genre,
              isSelected: selectedGenres.contains(genre),
              width: width / 2,
              height: width / 4,
              onTap: () {
                setState(() {
                  if (selectedGenres.contains(genre)) {
                    selectedGenres.remove(genre);
                  } else if (selectedGenres.length < 4) {
                    selectedGenres.add(genre);
                  }

                  isPreferenceCompleted = selectedGenres.length >= 4;
                });
              },
            ))
        .toList();
  }

  List<Widget> _generateSelectableLanguageBox(BuildContext context) {
    var width = getScreenSize(context).width - 3 * defaultMargin;
    return languages
        .map((language) => SelectableBoxWidget(
              language,
              isSelected: selectedLanguages == language,
              width: width / 2,
              height: width / 4,
              onTap: () {
                setState(() {
                  if (selectedLanguages != language) {
                    selectedLanguages = language;
                  }
                });
              },
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (widget.registrationModel.selectedGenres != null) {
      selectedGenres = widget.registrationModel.selectedGenres;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _backToPreviousPage() {
      widget.registrationModel.password = '';
      context
          .bloc<PageBloc>()
          .add(GoToRegistrationPage(widget.registrationModel));
    }

    void _confirmPreferenceUserData() {
      widget.registrationModel.selectedGenres = selectedGenres;
      widget.registrationModel.selectedLanguage = selectedLanguages;
      context
          .bloc<PageBloc>()
          .add(GoToAccountConfirmartionPage(widget.registrationModel));
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
            child: CustomAppBar('', _backToPreviousPage),
          ),
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    margin: EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Select Your\nFavorite Genres',
                      style: blackTextFont.copyWith(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Wrap(
                      spacing: defaultMargin,
                      runSpacing: defaultMargin,
                      children: _generateSelectableGenreBox(context),
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    margin: EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Movie Languages\nYou Prefer',
                      style: blackTextFont.copyWith(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Wrap(
                      spacing: defaultMargin,
                      runSpacing: defaultMargin,
                      children: _generateSelectableLanguageBox(context),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      child: FloatingActionButton(
                        elevation: 0.0,
                        backgroundColor:
                            (isPreferenceCompleted) ? mainColor : accentColor4,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24.0,
                          color: (isPreferenceCompleted)
                              ? Colors.white
                              : accentColor3,
                        ),
                        onPressed: isPreferenceCompleted
                            ? _confirmPreferenceUserData
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
