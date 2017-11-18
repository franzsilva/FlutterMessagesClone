import 'package:flutter/material.dart';
import 'package:flutter_messages_clone/widgets/leave_behind.dart';


enum MainMenuOptions { archived, blockedContacts, settings, help }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Choice {
  const Choice({this.title, this.icon, this.route});
  final String title;
  final IconData icon;
  final MainMenuOptions route;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Archived', route: MainMenuOptions.archived),
  const Choice(
      title: 'Blocked contacts', route: MainMenuOptions.blockedContacts),
  const Choice(title: 'Settings', route: MainMenuOptions.settings),
  const Choice(title: 'Help & feedback', route: MainMenuOptions.help),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isSearching = false;
  final TextEditingController _searchQuery = new TextEditingController();

  void _incrementCounter() {}
  void onMenuSelected(MainMenuOptions value) {
    switch (value) {
      case MainMenuOptions.archived:
        Navigator.of(context).pushNamed('/archived');
        break;
      case MainMenuOptions.blockedContacts:
        Navigator.of(context).pushNamed('/blockedContacts');
        break;
      case MainMenuOptions.settings:
        Navigator.of(context).pushNamed('/settings');
        break;
      default: // Without this, you see a WARNING.
        print('Default');
    }
  }

  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
      onRemove: () {
        setState(() {
          _isSearching = false;
          _searchQuery.clear();
        });
      },
    ));
    setState(() {
      _isSearching = true;
    });
  }

  Widget buildMainBar(title) {
    return new AppBar(
      title: new Text(title),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.search), onPressed: _handleSearchBegin),
        new PopupMenuButton(
            onSelected: onMenuSelected,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return new PopupMenuItem<MainMenuOptions>(
                  child: new Text(choice.title),
                  value: choice.route,
                );
              }).toList();
            })
      ],
    );
  }

  Widget buildSearchBar() {
    return new AppBar(
      leading: new BackButton(),
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        decoration: const InputDecoration(
          hintText: 'Search messages',
          hideDivider: true,
        ),
      ),
      actions: <Widget>[
        new PopupMenuButton(itemBuilder: (BuildContext context) {
          return choices.map((Choice choice) {
            return new PopupMenuItem<Choice>(
              child: new Text(choice.title),
              value: choice,
            );
          }).toList();
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _isSearching ? buildSearchBar() : buildMainBar(widget.title),
      body: new LeaveBehindMessages(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/new_conversation'),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

