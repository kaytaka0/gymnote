import 'package:flutter/material.dart';
import 'package:gymnote/workout_start.dart';
import 'package:location/location.dart';

import 'gym_not_found.dart';
import 'loading.dart';
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
      home: HomePage(title: 'トレーニング記録'),
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
  //ローディング表示の状態
  bool visibleLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(),
            OverlayLoadingMolecules(
                visible: visibleLoading, message: "位置情報を取得しています..."),
          ],
        ),
      ),
      floatingActionButton: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: visibleLoading
          ? null
          : () async {
              // GymNotFoundPage, WorkoutStartPageのいづれかに遷移する
              // 位置情報の取得が非同期関数を用いるため、ボタンが押された際にはローディングを表示させる
              setState(() {
                visibleLoading = true;
              });

              // await Future.delayed(const Duration(milliseconds: 2000), () {});
              // 位置情報判定
              bool isGetLocation = await checkLocation();
              if (!isGetLocation) {
                // ローディング終了
                setState(() {
                  visibleLoading = false;
                });
                return;
              }

              LocationData currentLocation =
                  await (new Location().getLocation());

              // ローディング終了
              setState(() {
                visibleLoading = false;
              });

              if (inGym(currentLocation)) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return WorkOutStartPage();
                  }),
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GymNotFoundPage();
                  }),
                );
              }
            },
      icon: Icon(Icons.add),
      label: const Text('記録を追加する'),
      backgroundColor:
          visibleLoading ? Colors.grey.shade700 : Colors.deepPurple,
    );
  }
}
