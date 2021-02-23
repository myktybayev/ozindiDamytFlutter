
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_user.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password) async{
    try{

      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return FirebaseUser.fromFirease(user);

    }catch(e){
      return null;
    }
  }

  Future<FirebaseUser> registerInWithEmailAndPassword(String email, String password) async{
    try{

      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return FirebaseUser.fromFirease(user);

    }catch(e){
      return null;
    }
  }

  Future logOut() async{
    await  _fAuth.signOut();
  }

  Stream<FirebaseUser> get currectUser{
    return _fAuth.authStateChanges().map((User user) =>
    user != null ? FirebaseUser.fromFirease(user) : null);
  }

}