import 'package:bet_for_big/MVC/view/homeScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
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
                            Icon(
                              Icons.home,
                              color: _currentIndex == 0
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              size: _currentIndex == 0 ? 30.sp : 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'MENU',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 7.sp),
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
                            Icon(
                              Icons.assignment,
                              color: _currentIndex == 1
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              size: 25.sp,
                              // _currentIndex == 1 ? 30.sp : 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'YESTERDAY PICKS',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 7.sp),
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
                            Icon(
                              Icons.add_task_sharp,
                              color: _currentIndex == 2
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              size: 25.sp,
                              // _currentIndex == 2 ? 30.sp : 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'PACKAGES',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 7.sp),
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
                            Icon(
                              Icons.assignment,
                              color: _currentIndex == 3
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              size: 25.sp,
                              // _currentIndex == 1 ? 30.sp : 25.sp,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'SUBSCRIBED PICKS',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 7.sp),
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
                            Icon(
                              Icons.person_2,
                              color: _currentIndex == 4
                                  ? themeController.colorPrimary
                                  : const Color.fromARGB(255, 180, 179, 179),
                              size: 25.sp,
                              // _currentIndex == 4 ? 30.sp : 25.sp,
                            ),
                            Text(
                              'MY ACTION',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 7.sp),
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
        return HomeScreen();

      case 2:
        return HomeScreen();
      case 3:
        return HomeScreen();
      case 4:
        return HomeScreen();
      default:
        return HomeScreen();
    }
  }
}
