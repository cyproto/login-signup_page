import 'package:flutter/material.dart';
import 'auth.dart';
import 'dart:async';

class home extends StatefulWidget {
  home({Key key, this.auth, this.id, this.signOut})
      : super(key: key);

  final baseAuthen auth;
  final VoidCallback signOut;
  final String id;

  @override
  State<StatefulWidget> createState() => new _homeState();
}

class _homeState extends State<>