import 'package:bet_for_big/MVC/view/historicalRecordsScreen.dart';
import 'package:bet_for_big/MVC/view/dummyScreen.dart';
import 'package:bet_for_big/MVC/view/homeScreen.dart';
import 'package:bet_for_big/MVC/view/myActionScreen.dart';
import 'package:bet_for_big/MVC/view/profileScreen.dart';
import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/components/drawer.dart';
import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/helper/data_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constant/theme.dart';

class BottomNavBar extends StatefulWidget {
  final int? initialIndex;
  BottomNavBar({this.initialIndex});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      _currentIndex = widget.initialIndex ?? _currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(
        builder: (themeController) => AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
            ),
            child: Scaffold(
              extendBody: true,
              appBar: CustomAppBar(),
              drawer: AppDrawer(),
              body: _buildPage(_currentIndex),
              bottomNavigationBar: Material(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/home.svg',
                              color: _currentIndex == 0
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              height: 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'MENU',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _currentIndex == 0
                                      ? themeController.colorPrimary
                                      : const Color.fromARGB(
                                          255, 180, 179, 179),
                                  fontSize: 7.sp),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ball.svg',
                              color: _currentIndex == 1
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              height: 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'YESTERDAY PICKS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _currentIndex == 1
                                      ? themeController.colorPrimary
                                      : const Color.fromARGB(
                                          255, 180, 179, 179),
                                  fontSize: 7.sp),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/package.svg',
                              color: _currentIndex == 2
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              height: 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'PACKAGES',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _currentIndex == 2
                                      ? themeController.colorPrimary
                                      : const Color.fromARGB(
                                          255, 180, 179, 179),
                                  fontSize: 7.sp),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/calculator.svg',
                              color: _currentIndex == 3
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              height: 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'SUBSCRIBED PICKS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _currentIndex == 3
                                      ? themeController.colorPrimary
                                      : const Color.fromARGB(
                                          255, 180, 179, 179),
                                  fontSize: 7.sp),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _currentIndex = 4;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: _currentIndex == 4
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              radius: 13.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(110),
                                child: ImageWidget(
                                    height: 23.sp,
                                    width: 23.sp,
                                    imageUrl: DataStroge.userImage.string
                                    // 'https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp'
                                    ),
                              ),
                            ),
                            Text(
                              'MY ACTION',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _currentIndex == 4
                                      ? themeController.colorPrimary
                                      : const Color.fromARGB(
                                          255, 180, 179, 179),
                                  fontSize: 7.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return HistoryRecordScreen();

      case 2:
        return MyActionScreen();
      case 3:
        return HistoryRecordScreen();
      case 4:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }
}
