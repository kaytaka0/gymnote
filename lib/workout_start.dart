import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'gym_location.dart';

class WorkOutStartPage extends StatefulWidget {
  WorkOutStartPage({Key key, this.gymData}) : super(key: key);

  final HashMap<dynamic, dynamic> gymData;

  @override
  _WorkOutStartState createState() => _WorkOutStartState();
}

class _WorkOutStartState extends State<WorkOutStartPage> {
  final LocalStorage storage = new LocalStorage(visitListFileName);

  _addItem(HashMap<dynamic, dynamic> gymData) {
    setState(() {
      // LocalStorageからデータ列を取得
      VisitList visitList = new VisitList();
      List<dynamic> visits = storage.getItem('gym_visit');
      visitList.items = visits == null
          ? []
          : visits
              .map((e) => new VisitItem(
                  locationId: e['locationId'],
                  locationName: e['locationName'],
                  date: DateTime.parse(e['date'])))
              .toList();

      // 新しいトレーニング記録を作成・追加
      final item = new VisitItem(
        locationId: gymData['locationId'],
        locationName: gymData['locationName'],
        date: DateTime.now(),
      );
      visitList.items.add(item);
      storage.setItem('gym_visit', visitList.toJSONEncodable());
    });
  }

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
              Text("${widget.gymData['locationName']}"),
              ElevatedButton.icon(
                onPressed: () {
                  // 新しいトレーニング記録を追加
                  _addItem(widget.gymData);
                  Navigator.of(context).pop(widget.gymData);

                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("記録を追加しました"),
                        behavior: SnackBarBehavior.floating));
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
