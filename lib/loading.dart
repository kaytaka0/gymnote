import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//
// 全面表示のローディング
//
class OverlayLoadingMolecules extends StatelessWidget {
  OverlayLoadingMolecules({@required this.visible, this.message});

  //表示状態
  final bool visible;
  final String message;

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
                CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
              ],
            ),
          )
        : Container();
  }
}
