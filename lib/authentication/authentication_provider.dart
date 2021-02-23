import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  AuthenticationProvider(this.firebaseAuth);
  Stream<User> get authState => firebaseAuth.idTokenChanges();

  Future<String> signUp({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<UserCredential> signIn({String email, String password}) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}