import 'package:flutter/material.dart';

class WorkOutStartPage extends StatefulWidget {
  WorkOutStartPage({Key key}) : super(key: key);

  @override
  _WorkOutStartState createState() => _WorkOutStartState();
}

class _WorkOutStartState extends State<WorkOutStartPage> {
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
