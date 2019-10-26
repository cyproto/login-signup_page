import 'package:flutter/material.dart';
import 'auth.dart';
import 'root.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Flutter login template',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: new root(auth: new authen(),),
    );
  }
}

