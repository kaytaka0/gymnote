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
        'latitude': 34.84167982331822,
        'longitude': 135.49863196854488,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100002,
      'locationName': '吹田',
      'locationData': new LocationData.fromMap({
        'latitude': 34.758478925237796,
        'longitude': 135.51538700709784,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100003,
      'locationName': '江坂',
      'locationData': new LocationData.fromMap({
        'latitude': 34.75813441711458,
        'longitude': 135.49589562212512,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100004,
      'locationName': '江坂御堂筋',
      'locationData': new LocationData.fromMap({
        'latitude': 34.7682297166469,
        'longitude': 135.4973125379926,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100005,
      'locationName': '千里吹田',
      'locationData': new LocationData.fromMap({
        'latitude': 34.784577880379906,
        'longitude': 135.5380985449386,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100006,
      'locationName': '箕面船場',
      'locationData': new LocationData.fromMap({
        'latitude': 34.818926223116954,
        'longitude': 135.49088033202122,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100007,
      'locationName': '豊中東',
      'locationData': new LocationData.fromMap({
        'latitude': 34.78856245323641,
        'longitude': 135.48604319812551,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100008,
      'locationName': '阪急豊中駅前',
      'locationData': new LocationData.fromMap({
        'latitude': 34.78722607885852,
        'longitude': 135.4616681340975,
      })
    },
  ),
  HashMap.from(
    {
      'locationId': 100009,
      'locationName': '高槻大畑',
      'locationData': new LocationData.fromMap({
        'latitude': 34.84013478863433,
        'longitude': 135.58961517467026,
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
