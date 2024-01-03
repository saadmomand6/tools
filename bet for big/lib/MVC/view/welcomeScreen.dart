import 'package:bet_for_big/MVC/view/onboardingScreen.dart';
import 'package:bet_for_big/MVC/view/registerationScreen.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/navigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final internetController = Get.put(InternetController());

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayWithPrimery,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: GestureDetector(
                onTap: () {
                  Navigation.getInstance
                      .screenNavigation(context, OnboardingScreen());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        themecontroller.colorPrimary
                            .withOpacity(0.9), // Adjust the opacity as needed
                        BlendMode.srcATop,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.screenPadding,
                        vertical: Constants.screenPadding),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.sp,
                          ),
                          Container(
                            height: 130.sp,
                            width: 240.sp,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
