part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      {@required String email,
      @required String password,
      @required String name,
      @required List<String> selectedGenres,
      @required String selectedLanguage}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = userCredential.user.convertToUser(
          name: name,
          selectedGenre: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user, null);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(null, e.message.trim());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail(
      {String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      UserModel user = await result.user.fromFireStore();
      return SignInSignUpResult(user, null);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(null, '${e.message.trim()}');
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  UserModel user;
  String message;

  SignInSignUpResult(this.user, this.message);
}
