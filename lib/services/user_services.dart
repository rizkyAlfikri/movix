part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel user) async {
    String genres = '';
    user.selectedGenres.forEach((genre) {
      genres += (genre == user.selectedGenres.last) ? genre : '$genre, ';
    });

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenre': genres,
      'selectedLanguages': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModel(id, snapshot.data()['email'],
        balance: snapshot.data()['balance'],
        profilePicture: snapshot.data()['profilePicture'],
        selectedGenres:
            (snapshot.data()['selectedGenre'] as String).split(', '),
        selectedLanguage: snapshot.data()['selectedLanguages'],
        name: snapshot.data()['name']);
  }
}
