import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FlutterToastDisplay {
  static FlutterToastDisplay? _instance;
  static FlutterToastDisplay get getInstance =>
      _instance ??= FlutterToastDisplay();
  final themeController = Get.put(ThemeHelper());
  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: themeController.colorPrimary,
        textColor: ThemeHelper.colortoasttext,
        fontSize: 14.0);
  }
}
