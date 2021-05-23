import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gymnote/time_not_valid.dart';
import 'package:gymnote/workout_start.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:localstorage/localstorage.dart';
import 'package:location/location.dart';

import 'gym_location.dart';
import 'gym_not_found.dart';
import 'loading.dart';
import 'location_utils.dart';
import 'log.dart';

void main() {
  runApp(MyApp());
  initializeDateFormatting('ja');
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
  final LocalStorage storage = new LocalStorage(visitListFileName);
  Location location = new Location();

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
            Container(
              child: LogPage(),
            ),
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
              // 位置情報の取得が非同期な処理であるため、ボタンが押された際にはローディングを表示させる
              setState(() {
                visibleLoading = true;
              });

              // 位置情報判定
              bool isGetLocation = await checkLocation(location);
              if (!isGetLocation) {
                // ローディング終了
                setState(() {
                  visibleLoading = false;
                });
                return;
              }

              LocationData currentLocation = await location.getLocation();

              // ローディング終了
              setState(() {
                visibleLoading = false;
              });

              List<dynamic> visits = storage.getItem('gym_visit') ?? [];
              DateTime lastVisitTime =
                  DateTime.parse(visits[visits.length - 1]['date']);

              if (!DateTime.now()
                  .isAfter(lastVisitTime.add(const Duration(hours: 2)))) {
                // 現在の時間が最後の記録から2時間以上立っていない場合
                // 新規登録は行わない
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TimeNotValidPage();
                  }),
                );
                return;
              }

              HashMap<dynamic, dynamic> gym = inGym(currentLocation);
              if (gym is HashMap) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return WorkOutStartPage(gymData: gym);
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
