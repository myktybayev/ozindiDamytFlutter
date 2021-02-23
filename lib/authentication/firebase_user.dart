import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser{
  String id;

  FirebaseUser.fromFirease(User user){
    id = user.uid;
  }

}