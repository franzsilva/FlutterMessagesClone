
import 'package:flutter_messages_clone/pages/new_conversation.dart';

import './pages/archived.dart';
import './pages/blocked_contacts.dart';
import './pages/settings.dart';
import './pages/home.dart';
import './pages/advanced_settings.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blueAccent[700],
          accentColor: Colors.blueAccent[700]),
      home: new MyHomePage(title: 'Messages'),
      routes: <String, WidgetBuilder>{
        '/archived': (BuildContext context) => new Archived(),
        '/blockedContacts': (BuildContext context) => new BlockedContacts(),
        '/settings': (BuildContext context) => new Settings(),
        '/advanced_settings': (BuildContext context) => new AdvancedSettings(),
        '/new_conversation': (BuildContext context) => new NewConversation()
      },
    );
  }
}