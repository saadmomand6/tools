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
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

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
              body: Container(
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
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.sp,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "WELCOME JHON \n YOU'RE NOW A HANDICAPPER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3),
                              ),
                              SizedBox(
                                height: 50.sp,
                              ),
                              CarouselSlider(
                                items: [
                                  Text('#01 BETTING APP \n YOU CAN FIND',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: Colors.white,
                                          letterSpacing: 3)),
                                  Text('#01 BETTING APP \n YOU CAN FIND',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: Colors.white,
                                          letterSpacing: 3)),
                                  Text('#01 BETTING APP \n YOU CAN FIND',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: Colors.white,
                                          letterSpacing: 3)),
                                  // Add more text items as needed
                                ],
                                options: CarouselOptions(
                                  height: 200.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  viewportFraction: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: RoundButton(
                            height: 45.sp,
                            title: 'Get Start',
                            margin: 0,
                            backgroundColor:
                                themecontroller.colorPrimary.withOpacity(0.0),
                            borderColor:
                                const Color.fromARGB(255, 216, 215, 215),
                            onTap: () {
                              Navigation.getInstance.screenNavigation(
                                  context, RegisterationScreen());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50.sp,
                        ),
                      ]),
                ),
              ),
            ),
          ));
    });
  }
}
