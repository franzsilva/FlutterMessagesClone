import 'package:flutter/material.dart';

class BlockedContacts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Blocked numbers"),
          backgroundColor: Colors.blue[500]),
      body: new Center(),
    );
  }
}
