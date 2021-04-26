import 'dart:collection';

import 'package:location/location.dart';

// 永続データのファイル名
const String visitListFileName = "gymnote_data.json";

// 登録済みのフィットネスジムの位置情報
List<HashMap> gymList = [
  HashMap.from(
    {
      'locationId': 100001,
      'locationName': '箕面下院',
      'locationData': new LocationData.fromMap({
        'latitude': 34.758475955821034,
        'longitude': 135.5153780809641,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100002,
      'locationName': '吹田',
      'locationData': new LocationData.fromMap({
        'latitude': 34,
        'longitude': 135,
      })
    },
  ),
];

class VisitItem {
  int locationId;
  String locationName;
  DateTime date;

  VisitItem({this.locationId, this.locationName, this.date});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['locationId'] = locationId;
    m['locationName'] = locationName;
    m['date'] = date.toString();
    return m;
  }
}

class VisitList {
  List<VisitItem> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
