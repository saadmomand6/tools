import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';

class MyActionCard extends StatelessWidget {
  const MyActionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: themecontroller.cardcolor),
          ),
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '01:13 PM 2022-11-25 - BET MGM',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: themecontroller.textcolor,
                    fontSize: 10.sp),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/BB.png'),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      'BOSTON BRUINS ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: themecontroller.textcolor,
                          fontSize: 10.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/CH.png'),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      'CAROLINA HURRICANES ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: themecontroller.textcolor,
                          fontSize: 10.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    boxBtn(
                      UpperValue: '20',
                      LowerValue: '-100',
                    ),
                  ],
                )
              ],
            ),
          ]),
        ),
      );
    });
  }
}

class boxBtn extends StatelessWidget {
  const boxBtn({
    super.key,
    required this.UpperValue,
    required this.LowerValue,
  });
  final String UpperValue;
  final String LowerValue;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: themecontroller.cardcolor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              UpperValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: themecontroller.textcolor,
                  fontSize: 8.sp),
            ),
            Text(
              LowerValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: themecontroller.textcolor,
                  fontSize: 8.sp),
            ),
          ],
        ),
      );
    });
  }
}
