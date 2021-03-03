part of 'model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;
  final String profilePicture;

  UserModel(this.id, this.email,
      {this.name,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance,
      this.profilePicture});

  @override
  String toString() {
    return this.id +
        " " +
        this.name +
        " " +
        this.email +
        " " +
        this.balance.toString();
  }

  UserModel copyWith({String name, String profilePicture, int balance}) {
    return UserModel(this.id, this.email,
        name: name ?? this.name,
        selectedGenres: this.selectedGenres,
        selectedLanguage: this.selectedLanguage,
        balance: balance ?? this.balance,
        profilePicture: profilePicture ?? this.profilePicture);
  }

  @override
  List<Object> get props => [
        this.id,
        this.email,
        this.name,
        this.selectedGenres,
        this.selectedLanguage,
        this.balance,
        this.profilePicture
      ];
}
