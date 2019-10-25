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
  static authStat authState = authStat.invalid;
  static String _id = "";

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

  void loggedIn(){
    widget.auth.getCurrUser().then((user) {
      setState(() {
        _id = user.uid.toString();
        authState = authStat.logged_in;
    });
  });
  }

  void loggedOut() {
    setState(() {
      authState = authStat.logged_out;
      _id = null;
    });
  }

  @override
  Widget build(BuildContext context){
    switch(authState){
      case authStat.invalid:
        break;
      case authStat.logged_out:
        return new LoginSignUp(
          auth: widget.auth,
          loggedIn: loggedIn,
        );
        break;
      case authStat.logged_in:
        if(_id.length > 0 && _id != null){
          return new home(
            id: _id,
            auth: widget.auth,
            onsignOut: loggedOut,
          );
        }
        break;
      default:
        break;
    }
  }
}
