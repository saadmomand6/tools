import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class Navigation {
  static Navigation? _instance;
  static Navigation get getInstance => _instance ??= Navigation();

  screenNavigation(BuildContext context, Widget childwidget) {
    return Navigator.push(
        context,
        Platform.isAndroid
            ? MaterialPageRoute(builder: (context) => childwidget)
            : CupertinoPageRoute(builder: (context) => childwidget));
  }

  void pagePushAndReplaceNavigation(BuildContext context, Widget childWidget) {
    if (Platform.isAndroid) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => childWidget,
        ),
        (route) => false,
      );
    } else if (Platform.isIOS) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => childWidget,
        ),
        (route) => false,
      );
    }
  }

  void Page_PushAndReplaceNavigationwithTransition(
      BuildContext context, Widget childWidget) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        child: childWidget,
        isIos: true,
        duration: Duration(milliseconds: 900),
        reverseDuration: Duration(milliseconds: 400),
      ),
      (route) => false,
    );
  }

  // void fromleftPage_PushAndReplaceNavigation(
  //     BuildContext context, Widget childWidget) {
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     PageTransition(
  //       type: PageTransitionType.leftToRightWithFade,
  //       child: childWidget,
  //       isIos: true,
  //       duration: Duration(milliseconds: 100),
  //       reverseDuration: Duration(milliseconds: 400),
  //     ),
  //     (route) => false,
  //   );
  // }
}
