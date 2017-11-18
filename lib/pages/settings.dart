import 'package:flutter/material.dart';
import 'dart:async';
enum Sounds { lafayette, jefferson }


class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  void _dummyVoid(s) {}
  bool notifications = true;
  bool hear = true;
  bool vibrate = true;
  Sounds _sound = Sounds.lafayette;


  Future<Null> _pickNotSound() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text('Notification sound'),
        content: new Column(
          children: <Widget>[
            new RadioListTile<Sounds>(
              title: const Text('Default notification sound'),
              value: Sounds.lafayette,
              groupValue: _sound,
              onChanged: (Sounds value) {
                setState(() {
                  _sound = value;
                });
              },
            ),
            new RadioListTile<Sounds>(
              title: const Text('Thomas Jefferson'),
              value: Sounds.jefferson,
              groupValue: _sound,
              onChanged: (Sounds value) {
                setState(() {
                  _sound = value;
                });
              },
            ),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Settings"), backgroundColor: Colors.blueAccent[700]),
      body: new ListView(children: <Widget>[
        new ListTile(
            title: new Text(
              "Default SMS app",
            ),
            subtitle: new Text("Messages")),
        new Divider(),
        new SwitchListTile(
          title: new Text("Notifications"),
          value: notifications,
          onChanged: (bool newValue) {
            setState(() {
              notifications = newValue;
            });
          },
        ),
        new Divider(),
        new ListTile(
            title: new Text(
              "Notification sound",
            ),
            subtitle: new Text("Default ringtone (Unknown ringtone)"),
            enabled: notifications, onTap: _pickNotSound),
        new Divider(),
        new SwitchListTile(
          title: new Text("Hear outgoing message sounds"),
          value: hear,
          onChanged: notifications == true
              ? (bool newValue) {
            setState(() {
              hear = newValue;
            });
          }
              : null,
        ),
        new Divider(),
        new SwitchListTile(
            title: new Text("Vibrate"),
            value: vibrate,
            onChanged: notifications == true
                ? (bool newValue) {
              setState(() {
                vibrate = newValue;
              });
            }
                : null),
        new Divider(),
        new ListTile(
            title: new Text(
              "Your current country",
            ),
            subtitle: new Text("Automatically detected (Ecuador)")),
        new Divider(),
        new ListTile(title: new Text("Advanced"), onTap: () => Navigator.of(context).pushNamed('/advanced_settings')),
      ]),
    );
  }
}