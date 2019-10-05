import 'package:flutter/material.dart';

class LoginSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp>{
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Flutter login template', textAlign: TextAlign.center,),
      ),
      body: Stack(
        children: <Widget>[
          _body(),
          _showProgress(),
        ],
      )
    );
  }
}

Widget _showProgress() {

if(_isLoading) {
  return Center(child: CircularProgressIndicator());
} return Container(height: 0.0,width: 0.0,);
}