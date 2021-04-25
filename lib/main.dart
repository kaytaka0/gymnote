import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'gym_not_found.dart';
import 'location_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymnote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
      ),
      home: HomePage(title: 'Gymnote'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _text = "ここはエニタイムフィットネスじゃないです";
  void _changeText(String t) {
    setState(() {
      _text = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                  child: Text("トレーニングを始める"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  onPressed: () async {
                    bool isGetLocation = await checkLocation();
                    if (isGetLocation) {
                      LocationData currentLocation =
                          await (new Location().getLocation());
                      if (inGym(currentLocation)) {
                        _changeText("ここはエニタイムフィットネスです");
                      } else {
                        _changeText("ここはエニタイムフィットネスじゃないです");
                      }
                    }
                  }),
            ),
            Text(_text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // GymNotFoundPage, WorkoutStartPageのいづれかに遷移する
          // 位置情報の取得が非同期関数を用いるため、ボタンが押された際にはローディングを表示させる
          //
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return GymNotFoundPage();
            }),
          );
        },
        icon: Icon(Icons.add),
        label: const Text('記録を追加する'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
