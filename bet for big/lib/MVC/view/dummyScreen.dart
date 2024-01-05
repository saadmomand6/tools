import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class dummyScreen extends StatelessWidget {
  dummyScreen({super.key});

  final internetController = Get.put(InternetController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayStyleForwhite,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
       
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenPadding,
                    vertical: Constants.screenPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('home'),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
