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
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('images/notfound.jpg'),
                      height: 200,
                      width: 200,
                    ),
                    Padding(
                      padding: new EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        subtitle: Text("位置情報によってフィットネスジムが見つかりませんでした。"),
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
