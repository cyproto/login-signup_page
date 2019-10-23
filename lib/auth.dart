import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class baseAuthen{
  Future<String> signIn(String email, String pass);
  Future<String> signUp(String email, String pass);
  Future<FirebaseUser> getCurrUser();
  Future<void> signOut();
}

class authen implements baseAuthen{
  String uid;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signIn(String email, String pass) async{
    FirebaseUser user = (await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)).user;
    return user.uid;
  }
  Future<String> signUp(String email, String pass) async{
    FirebaseUser user = (await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)).user;
    return user.uid;
  }
  Future<FirebaseUser> getCurrUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }
  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }
}