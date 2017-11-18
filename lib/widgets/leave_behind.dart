import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart' show lowerBound;

enum LeaveBehindDemoAction {
  reset,
  horizontalSwipe,
  leftSwipe,
  rightSwipe
}

List<MaterialColor> _myColors = [Colors.red, Colors.yellow, Colors.blue, Colors.green];

class LeaveBehindItem implements Comparable<LeaveBehindItem> {
  LeaveBehindItem({ this.index, this.name, this.subject, this.body });

  LeaveBehindItem.from(LeaveBehindItem item)
      : index = item.index, name = item.name, subject = item.subject, body = item.body;

  final int index;
  final String name;
  final String subject;
  final String body;

  @override
  int compareTo(LeaveBehindItem other) => index.compareTo(other.index);
}



class LeaveBehindMessages extends StatefulWidget {
  LeaveBehindMessages({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LeaveBehindMessagesPageState createState() => new _LeaveBehindMessagesPageState();
}

class _LeaveBehindMessagesPageState extends State<LeaveBehindMessages> {

  DismissDirection _dismissDirection = DismissDirection.horizontal;
  List<LeaveBehindItem> leaveBehindItems;
  bool pins = false;

  void initListItems() {
    leaveBehindItems = new List<LeaveBehindItem>.generate(30, (int index) {
      return new LeaveBehindItem(
          index: index,
          name: 'Sender $index',
          subject: 'Last message sent text',
          body: "Oct 24"
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initListItems();
  }

  void handleDemoAction(LeaveBehindDemoAction action) {
    switch (action) {
      case LeaveBehindDemoAction.reset:
        initListItems();
        break;
      case LeaveBehindDemoAction.horizontalSwipe:
        _dismissDirection = DismissDirection.horizontal;
        break;
      case LeaveBehindDemoAction.leftSwipe:
        _dismissDirection = DismissDirection.endToStart;
        break;
      case LeaveBehindDemoAction.rightSwipe:
        _dismissDirection = DismissDirection.startToEnd;
        break;
    }
  }

  void handleUndo(LeaveBehindItem item) {
    final int insertionIndex = lowerBound(leaveBehindItems, item);
    setState(() {
      leaveBehindItems.insert(insertionIndex, item);
    });
  }

  Widget buildItem(LeaveBehindItem item) {
    final _random = new Random();
    var _randomColor = _myColors[_random.nextInt(_myColors.length)];
    final ThemeData theme = Theme.of(context);
    return new Dismissible(
        key: new ObjectKey(item),
        direction: _dismissDirection,
        onDismissed: (DismissDirection direction) {
          setState(() {
            leaveBehindItems.remove(item);
          });

          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text('1 conversation archived'),
              action: new SnackBarAction(
                  label: 'UNDO',
                  onPressed: () { handleUndo(item); }
              )
          ));
        },
        background: new Container(
            color: Colors.grey,
            child: const ListTile(
                leading: const Icon(Icons.archive, color: Colors.white, size: 36.0)
            )
        ),
        secondaryBackground: new Container(
            color: Colors.grey,
            child: const ListTile(
                trailing: const Icon(Icons.archive, color: Colors.white, size: 36.0)
            )
        ),
        child: new Container(
            decoration: new BoxDecoration(
                color: theme.canvasColor,
                border: new Border(bottom: new BorderSide(color: theme.dividerColor))
            ),
            child: new ListTile(
                leading: new CircleAvatar(backgroundColor: _randomColor,
                  child: new Icon(Icons.person),
                  radius: 100.0,
                ),
                title: new Text(item.name),
                subtitle: new Text('${item.subject}\n${item.body}'),
                isThreeLine: true
            )
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: leaveBehindItems.map(buildItem).toList()
    );
  }
}

