import 'package:flutter/material.dart';
import 'login-signup.dart';
import 'auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Flutter login template',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new LoginSignUp(auth: new authen(),),
    );
  }
}

