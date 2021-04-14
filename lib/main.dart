import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

Future<bool> checkLocation() async {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return false;
    }
  }
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymnote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = "";
  String _text2 = "";
  void _changeText(String t) {
    setState(() {
      _text = t;
    });
  }

  void _changeText2(String t) {
    setState(() {
      _text2 = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(_text),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(_text2),
            ),
          ),
          Container(
            child: Center(
              child: RaisedButton(
                child: Text("Button"),
                color: Colors.white,
                shape: Border(
                  top: BorderSide(color: Colors.red),
                  left: BorderSide(color: Colors.blue),
                  right: BorderSide(color: Colors.yellow),
                  bottom: BorderSide(color: Colors.green),
                ),
                onPressed: () async {
                  bool isGetLocation = await checkLocation();
                  if (isGetLocation) {
                    Location location = new Location();
                    LocationData currentLocation = await location.getLocation();

                    LocationData gymLocation = new LocationData.fromMap({
                      'latitude': 34.84173822491373,
                      'longitude': 135.49867778891553,
                    });
                    // 小数第三位まで一致していればOKとする
                    bool isEqual =
                        (currentLocation.latitude - gymLocation.latitude)
                                    .abs() <
                                10e-3 &&
                            (currentLocation.longitude - gymLocation.longitude)
                                    .abs() <
                                10e-3;

                    _changeText("${isEqual.toString()}");
                    _changeText2(
                        "lat:${currentLocation.latitude}\n lon:${currentLocation.longitude}\n GYM\n lat:${gymLocation.latitude}\n lon:${gymLocation.longitude}");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
