// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../constant/theme.dart';

// class BottomNavBar extends StatefulWidget {
//   final int? initialIndex;
//   BottomNavBar({this.initialIndex});
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
    
//     setState(() {
//       _currentIndex = widget.initialIndex ?? _currentIndex;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ThemeHelper>(
//         builder: (themeController) => AnnotatedRegion(
//             value: const SystemUiOverlayStyle(
//               systemNavigationBarColor: Colors.white,
//             ),
//             child: Scaffold(
//               extendBody: true,
//               body: _buildPage(_currentIndex),
//               bottomNavigationBar: Material(
//                 elevation: 0.0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0)),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                           setState(() {
//                             _currentIndex = 0;
//                           });
//                         },
//                         child: Icon(
//                           Icons.home,
//                           color: _currentIndex == 0
//                               ? Colors.pink
//                               : const Color.fromARGB(255, 180, 179, 179),
//                           size: _currentIndex == 0 ? 30.sp : 25.sp,
//                         ),
//                       ),
//                       GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                           setState(() {
//                             _currentIndex = 1;
//                           });
//                         },
//                         child: Icon(
//                           Icons.assignment,
//                           color: _currentIndex == 1
//                               ? Colors.pink
//                               : const Color.fromARGB(255, 180, 179, 179),
//                           size: _currentIndex == 1 ? 30.sp : 25.sp,
//                         ),
//                       ),
//                       GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                           setState(() {
//                             _currentIndex = 2;
//                           });
//                         },
//                         child: Icon(
//                           Icons.add_task_sharp,
//                           color: _currentIndex == 2
//                               ? Colors.pink
//                               : const Color.fromARGB(255, 180, 179, 179),
//                           size: _currentIndex == 2 ? 30.sp : 25.sp,
//                         ),
//                       ),
//                       GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                           setState(() {
//                             _currentIndex = 3;
//                           });
//                         },
//                         child: Icon(
//                           Icons.person_2,
//                           color: _currentIndex == 3
//                               ? Colors.pink
//                               : const Color.fromARGB(255, 180, 179, 179),
//                           size: _currentIndex == 3 ? 30.sp : 25.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )));
//   }

//   Widget _buildPage(int index) {
//     switch (index) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return ProcessListScreen();
    
//       case 2:
//         return CompleteListScreen();
//       case 3:
//         return ProfileScreen();
//       default:
//         return HomeScreen();
//     }
//   }
// }




// //  BottomNavigationBar(
// //                         elevation: 0,
// //                         backgroundColor: Colors.transparent,
// //                         currentIndex: _currentIndex,
// //                         selectedIconTheme:
// //                             IconThemeData(color: themeController.colorPrimary),
// //                         unselectedIconTheme: IconThemeData(
// //                           color: themeController.bottomiconcolor,
// //                         ),
// //                         selectedItemColor: themeController.colorPrimary,
// //                         unselectedItemColor: themeController.bottomiconcolor,
// //                         selectedLabelStyle: TextStyle(
// //                             color: themeController.colorPrimary,
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 12.sp),
// //                         unselectedLabelStyle: TextStyle(
// //                             color: themeController.bottomiconcolor,
// //                             fontWeight: FontWeight.w500,
// //                             fontSize: 10.sp),
// //                         onTap: (index) {
// //                           setState(() {
// //                             _currentIndex = index;
// //                           });
// //                         },
// //                         type: BottomNavigationBarType.fixed,
// //                         items: <BottomNavigationBarItem>[
// //                           BottomNavigationBarItem(
// //                             icon: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: _currentIndex == 0
// //                                   ? SvgPicture.asset(
// //                                       "assets/icons/home.svg",
// //                                       height: 20,
// //                                       width: 20,
// //                                     )
// //                                   : SvgPicture.asset(
// //                                       "assets/icons/home.svg",
// //                                       height: 17,
// //                                       width: 17,
// //                                       color: themeController.bottomiconcolor,
// //                                     ),
// //                             ),
// //                             label: 'Home'.tr,
// //                           ),
// //                           BottomNavigationBarItem(
// //                             icon: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: _currentIndex == 1
// //                                   ? SvgPicture.asset(
// //                                       "assets/icons/process-icon.svg",
// //                                       height: 20,
// //                                       width: 20,
// //                                     )
// //                                   : SvgPicture.asset(
// //                                       "assets/icons/process-icon.svg",
// //                                       height: 17,
// //                                       width: 17,

// //                                       color: themeController.bottomiconcolor,
// //                                       // color: Theme.of(context).disabledColor,
// //                                     ),
// //                             ),
// //                             label: 'Explore'.tr,
// //                           ),
// //                           BottomNavigationBarItem(
// //                             icon: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: _currentIndex == 2
// //                                   ? SvgPicture.asset(
// //                                       "assets/icons/completed.svg",
// //                                       height: 20,
// //                                       width: 20,
// //                                     )
// //                                   : SvgPicture.asset(
// //                                       "assets/icons/completed.svg",
// //                                       height: 17,
// //                                       width: 17,
// //                                       color: themeController.bottomiconcolor,
// //                                     ),
// //                             ),
// //                             label: 'Cart'.tr,
// //                           ),
                          
// //                           BottomNavigationBarItem(
// //                             icon: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: _currentIndex == 3
// //                                   ? SvgPicture.asset(
// //                                       "assets/icons/user.svg",
// //                                       height: 20,
// //                                       width: 20,
// //                                       color: themeController.colorPrimary,
// //                                     )
// //                                   : SvgPicture.asset(
// //                                       "assets/icons/userb.svg",
// //                                       height: 17,
// //                                       width: 17,
// //                                       color: themeController.bottomiconcolor,
// //                                     ),
// //                             ),
// //                             label: 'Profile'.tr,
// //                           ),
// //                         ],
// //                       ),
