import 'package:flutter/material.dart';

class GymNotFoundPage extends StatefulWidget {
  GymNotFoundPage({Key key}) : super(key: key);

  @override
  _GymNotFoundState createState() => _GymNotFoundState();
}

class _GymNotFoundState extends State<GymNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("記録を追加"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("位置情報によってフィットネスジムが見つかりませんでした。"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.keyboard_backspace),
        label: const Text("戻る"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
