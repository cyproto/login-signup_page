import 'package:flutter/material.dart';
import 'auth.dart';
import 'root.dart';
import 'authprovider.dart';

class home extends StatefulWidget {
  home({Key key, this.auth, this.id, this.onsignOut})
      : super(key: key);

  final baseAuthen auth;
  final VoidCallback onsignOut;
  final String id;

  @override
  State<StatefulWidget> createState() => new _homeState();
}

class _homeState extends State<home> {

  Future<void> signoutacc(BuildContext context) async{
    try{
      final baseAuthen auth = AuthProvider.of(context).auth;
      auth.signOut();
      widget.onsignOut();
    }
    catch(e){
      print(e);
    }
  }
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Logout"),
              onTap: () => signoutacc(context),
              trailing: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          hello(),
        ],
      ),
    );
  }

  Widget hello() {
    return Scaffold(
      body: Center(
        child: Text("Welcome, " + widget.id,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}