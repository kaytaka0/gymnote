import 'package:flutter/material.dart';
import 'package:gymnote/gym_location.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class LogPage extends StatefulWidget {
  LogPage({Key key}) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final LocalStorage storage = new LocalStorage(visitListFileName);

  List<Widget> cardList(VisitList visitList) {
    List<Widget> list = [];
    DateFormat format = new DateFormat.MMMd('ja');
    for (VisitItem item in visitList.items) {
      list.add(
        new Card(
          child: ListTile(
            title: Text("${format.format(item.date)} ${item.locationName}"),
          ),
        ),
      );
    }
    return list;
  }

  Widget heatMap(VisitList visitList) {
    return HeatMapCalendar(
      input: {
        TimeUtils.removeTime(visitList.items[0].date): 1,
        TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 10))): 1,
      },
      colorThresholds: {
        1: Colors.green,
      },
      weekDaysLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
      monthsLabels: [
        "",
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      squareSize: 16.0,
      textOpacity: 0.3,
      labelTextColor: Colors.blueGrey,
      dayTextColor: Colors.blue[500],
    );
  }

  Widget logWidget(VisitList visitList) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: heatMap(visitList),
          ),
          ...cardList(visitList),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          // localStorageから取得
          VisitList visitList = new VisitList();
          List<dynamic> visits = storage.getItem('gym_visit');
          visitList.items = visits
              .map((e) => new VisitItem(
                  locationId: e['locationId'],
                  locationName: e['locationName'],
                  date: DateTime.parse(e['date'])))
              .toList();

          return logWidget(visitList);
        } else {
          return Container();
        }
      },
    );
  }
}
