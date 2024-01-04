import 'dart:io';
import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constant/constants.dart';
import 'spring_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.onTap,
  });

  final Function()? onTap;

  final themecontroller = Get.put(ThemeHelper());

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeHelper());
    return AppBar(
      centerTitle: false,
      leadingWidth: 150.sp,
      leading: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.screenPadding),
        child: Container(
          height: 20.sp,
          width: 70.sp,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo2.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.screenPadding),
            child: Icon(
              Icons.menu,
              color: themecontroller.colorPrimary,
              size: 25.sp,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.sp);
}
