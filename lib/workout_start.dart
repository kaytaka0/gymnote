import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'gym_location.dart';

class WorkOutStartPage extends StatefulWidget {
  WorkOutStartPage({Key key, this.gymName}) : super(key: key);

  final String gymName;

  @override
  _WorkOutStartState createState() => _WorkOutStartState();
}

class _WorkOutStartState extends State<WorkOutStartPage> {
  final LocalStorage storage = new LocalStorage(visitListFileName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トレーニングを始める"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("位置情報によってフィットネスジムが見つかりました。"),
              Text("${widget.gymName}"),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.double_arrow),
                label: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "トレーニング開始",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
