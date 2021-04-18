import 'package:location/location.dart';

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

bool inGym(LocationData currentLocation) {
  List<LocationData> gymLocation = [
    new LocationData.fromMap({
      'latitude': 34.84173822491373,
      'longitude': 135.49867778891553,
    }),
    new LocationData.fromMap({
      'latitude': 34.758475955821034,
      'longitude': 135.5153780809641,
    }),
    new LocationData.fromMap({
      'latitude': 34.787337859052606,
      'longitude': 135.46172630326728,
    }),
    new LocationData.fromMap({
      'latitude': 34.81894410513142,
      'longitude': 135.4908909891249,
    }),
    new LocationData.fromMap({
      'latitude': 34.82571310203641,
      'longitude': 135.46588099888686,
    }),
  ];

  // 小数第三位まで一致していればOKとする
  LocationData matchedLocation;
  gymLocation.forEach((location) {
    bool isEqual =
        (currentLocation.latitude - location.latitude).abs() < 10e-3 &&
            (currentLocation.longitude - location.longitude).abs() < 10e-3;
    if (isEqual) {
      matchedLocation = location;
    }
  });
  print(matchedLocation);
  if (matchedLocation != null) {
    return true;
  }
  return false;
}
