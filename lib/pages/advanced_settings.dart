import 'package:flutter/material.dart';
enum Sounds { lafayette, jefferson }


class AdvancedSettings extends StatefulWidget {
  AdvancedSettings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdvancedSettingsPageState createState() => new _AdvancedSettingsPageState();
}

class _AdvancedSettingsPageState extends State<AdvancedSettings> {
  void _dummyVoid(s) {}
  bool downloadMms = true;
  bool downloadRoaming = true;
  bool useSimpleChar = true;
  bool deliverReport = false;
  bool serviceMessages = true;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Advanced"), backgroundColor: Colors.blueAccent[700]),
      body: new ListView(children: <Widget>[
        new SwitchListTile(
          title: new Text("Auto-download MMS"),
          value: downloadMms,
          onChanged: (bool newValue) {
            setState(() {
              downloadMms = newValue;
            });
          },
        ),
        new Divider(),
        new SwitchListTile(
          title: new Text("Auto-download MMS when roaming"),
          value: downloadRoaming,
          onChanged: downloadMms == true ? (bool newValue) {
            setState(() {
              downloadRoaming = newValue;
            }
            );
          } : null,
        ),
        new Divider(),
        new SwitchListTile(
          title: new Text("Use simple characters"),
          subtitle: new Text("Convert special characters in your SMS messages"),
          value: useSimpleChar,
          onChanged: (bool newValue) {
            setState(() {
              useSimpleChar = newValue;
            });
          },
        ),
        new Divider(),
        new SwitchListTile(
          title: new Text("Get SMS Delivery reports"),
          subtitle: new Text("Find out when an SMS message is delivered"),
          value: deliverReport,
          onChanged: (bool newValue) {
            setState(() {
              deliverReport = newValue;
            });
          },
        ),
        new Divider(),
        new SwitchListTile(
          title: new Text("Service messages"),
          subtitle: new Text("Receive service messages"),
          value: serviceMessages,
          onChanged: (bool newValue) {
            setState(() {
              serviceMessages = newValue;
            });
          },
        ),
        new Divider(),
        new ListTile(title: new Text("Wireless alerts")),
        new ListTile(title: new Text("SIM card messages")),
        new ListTile(title: new Text("Phone number"), subtitle: new Text("Unknown"),),
      ]),
    );
  }
}