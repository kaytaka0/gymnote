import 'package:flutter/material.dart';

class TimeNotValidPage extends StatefulWidget {
  TimeNotValidPage({Key key}) : super(key: key);

  @override
  _TimeNotValidState createState() => _TimeNotValidState();
}

class _TimeNotValidState extends State<TimeNotValidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("記録を追加"),
      ),
      body: Center(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('images/timenotvalid.jpg'),
                      height: 200,
                      width: 200,
                    ),
                    Padding(
                      padding: new EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Designed by pch.vector / Freepik",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        subtitle: Text("すでに記録されています。一定時間後に記録を行なってください。"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
