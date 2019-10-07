import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class baseAuthen{
  Future<String> signIn(String email, String pass);
  Future<String> signUp(String email, String pass);
  Future<String> getCurrUser();
  Future<void> signOut();
}

class authen implements baseAuthen{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signIn(String email, String pass) async{
    FirebaseUser user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)).user;
    return user.uid;
  }
  Future<String> signUp(String email, String pass) async{
    FirebaseUser user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)).user;
    return user.uid;
  }
  Future<String> getCurrUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }
  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }
}