import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  LogPage({Key key}) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  Widget cardList() {
    List<Widget> list = [];
    List<String> titles = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
    ];
    for (var title in titles) {
      list.add(
        new Card(
          child: ListTile(
            title: Text(title),
          ),
        ),
      );
    }
    return ListView(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cardList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close),
        label: const Text('閉じる'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
