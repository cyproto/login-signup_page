import 'package:flutter/material.dart';
import 'login-signup.dart';
import 'home.dart';
import 'auth.dart';

class root extends StatefulWidget{
  root({this.auth});

  final baseAuthen auth;

  @override
  State<StatefulWidget> createState() => new _rootState();
}

enum authStat{
  invalid,
  logged_out,
  logged_in
}

class _rootState extends State<root> {
  authStat authState = authStat.invalid;
  String _id = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrUser().then((user) {
      setState(() {
        if (user != null) {
          _id = user?.uid;
        }
        authState =
        user?.uid == null ? authStat.logged_out : authStat.logged_in;
      });
    });
  }

  void _loggedIn(){
    widget.auth.getCurrUser().then((user) {
      setState(() {
        _id = user.uid.toString();
      });
    });
    setState(() {
      authState = authStat.logged_out;
      _id = "";
    });
  }

}