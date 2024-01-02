import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastDisplay {
  static FlutterToastDisplay? _instance;
  static FlutterToastDisplay get getInstance =>
      _instance ??= FlutterToastDisplay();

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.pink,
        textColor: ThemeHelper.colortoasttext,
        fontSize: 14.0);
  }
}
