import 'package:flutter/material.dart';


class Archived extends StatelessWidget {
  void _dummyVoid() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Archived"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.more_vert), onPressed: _dummyVoid)
          ],
          backgroundColor: Colors.grey),
      body: new Center(),
    );
  }
}