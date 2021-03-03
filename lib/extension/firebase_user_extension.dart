part of 'extension.dart';

extension FirebaseUserExtension on User {
  UserModel convertToUser(
          {String name = "No Name",
          List<String> selectedGenre = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserModel(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenre,
          selectedLanguage: selectedLanguage,
          balance: balance);

  Future<UserModel> fromFireStore() => UserServices.getUser(this.uid);
}
