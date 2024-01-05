import 'package:bet_for_big/MVC/view/profileScreen.dart';
import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/data/dummyData/mockData.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscribedListScreen extends StatelessWidget {
  SubscribedListScreen({super.key});

  final internetController = Get.put(InternetController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayStyleForwhite,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  title: Text(
                'SUBSCRIBED LIST',
                style: TextStyle(
                    color: themecontroller.colorPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              )),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.screenPadding,
                  vertical: Constants.screenPadding,
                ),
                child: Column(
                  children: Mockdata.subscriptionPickList
                      .map((e) => Padding(
                            padding: EdgeInsets.only(top: 10.sp),
                            child: pickCard(
                              width: double.infinity,
                              icon: Icons.remove_red_eye_outlined,
                              packageName: e['name'],
                              stateName: e['stateName'],
                              onTap: () {},
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ));
    });
  }
}
