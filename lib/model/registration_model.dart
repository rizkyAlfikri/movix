part of 'model.dart';

class RegistrationModel {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLanguage;
  File pictureFile;

  RegistrationModel(
      {this.name,
      this.email,
      this.password,
      this.selectedGenres,
      this.selectedLanguage,
      this.pictureFile});
}
