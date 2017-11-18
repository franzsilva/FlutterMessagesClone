import 'package:flutter/material.dart';

enum KeyboardTypes { phone, text }
const String _searchHint = "Type a name, phone number, or email";

class NewConversation extends StatefulWidget {
  @override
  _NewConversationState createState() => new _NewConversationState();
}

class _NewConversationState extends State<NewConversation> {
  final TextEditingController _searchQuery = new TextEditingController();

  var _keyboardType = KeyboardTypes.text;

  Widget _pickSearchWidget() {
    return _keyboardType == KeyboardTypes.text
        ? textSearchBar()
        : phoneSearchBar();
  }

  Widget textSearchBar() {
    return new AppBar(
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: _searchHint,
          hideDivider: true,
        ),
      ),
      backgroundColor: Colors.white,
      leading: new Center(
          child: new Text(
        "TO",
        style: const TextStyle(color: Colors.grey),
      )),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.dialpad, color: Colors.grey),
            onPressed: () {
              setState(() {
                _keyboardType = KeyboardTypes.phone;
              });
            })
      ],
    );
  }

  Widget phoneSearchBar() {
    return new AppBar(
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: _searchHint,
          hideDivider: true,
        ),
      ),
      backgroundColor: Colors.white,
      leading: new Center(
          child: new Text(
        "TO",
        style: const TextStyle(color: Colors.grey),
      )),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.keyboard, color: Colors.grey),
            onPressed: () {
              setState(() {
                _keyboardType = KeyboardTypes.text;
              });
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("New conversation"), elevation: 0.0),
      body: new Column(
        children: <Widget>[
          _pickSearchWidget(),
          new Expanded(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: <Widget>[
              new ListTile(
                title: new Text("Start group conversation"),
                leading: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: new Icon(Icons.group_add),
                ),
              ),
              new ListTile(
                title: new Text('Top contacts'),
              ),
              new Padding(padding: const EdgeInsets.all(20.0), child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                ],
              )),
              new Padding(padding: const EdgeInsets.all(24.0), child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                  new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[new CircleAvatar(radius: 35.0, child: new FlutterLogo(colors: Colors.red,),), new Text("Recent")],),
                ],
              )),
              new ListTile(
                leading: new Center(child: new Text('...', style: const TextStyle(fontSize: 20.0),),),
              ),
              new ListTile(
                leading: new CircleAvatar(backgroundColor: Colors.green,child: new Icon(Icons.star),),
                title: new Text('*SOS'),
                subtitle: new Text("*767"),
                trailing: new Text("Mobile"),
              ),
              new ListTile(
                leading: new Center(child: new Text('A', style: const TextStyle(fontSize: 20.0),),),
              ),
              new ListTile(
                leading: new CircleAvatar(backgroundColor: Colors.blue,child: new Text("A"),),
                title: new Text('Albert Artichoke'),
                subtitle: new Text("*767"),
                trailing: new Text("Mobile"),
              ),
              new ListTile(
                leading: new CircleAvatar(backgroundColor: Colors.grey,child: new Text("A"),),
                title: new Text('Antonia'),
                subtitle: new Text("*767"),
                trailing: new Text("Mobile"),
              ),
              new ListTile(
                leading: new Center(child: new Text('B', style: const TextStyle(fontSize: 20.0),),),
              ),
              new ListTile(
                leading: new CircleAvatar(backgroundColor: Colors.yellow,child: new Text("B"),),
                title: new Text('Bruno Diaz'),
                subtitle: new Text("*767"),
                trailing: new Text("Mobile"),
              ),


            ],
          ))
        ],
      ),
    );
  }
}
