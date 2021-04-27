import 'dart:collection';

import 'package:gymnote/gym_location.dart';
import 'package:location/location.dart';

Future<bool> checkLocation(Location location) async {
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

HashMap<dynamic, dynamic> inGym(LocationData currentLocation) {
  // 小数第三位まで一致していればOKとする
  HashMap<dynamic, dynamic> matchedLocation;
  gymList.forEach((location) {
    bool isEqual =
        (currentLocation.latitude - location['locationData'].latitude).abs() <
                10e-3 &&
            (currentLocation.longitude - location['locationData'].longitude)
                    .abs() <
                10e-3;
    if (isEqual) {
      matchedLocation = location;
    }
  });
  return matchedLocation;
}
