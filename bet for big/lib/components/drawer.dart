import 'package:bet_for_big/MVC/view/myBetScreen.dart';
import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/constant/navigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/data_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: themecontroller.colorPrimary,
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg2.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      themecontroller.colorPrimary
                          .withOpacity(0.6), // Adjust the opacity as needed
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 21.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: ImageWidget(
                              height: 80.sp,
                              width: 100,
                              imageUrl: DataStroge.userImage.string
                              // 'https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp'
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 150.sp,
                        child: Text(
                          textAlign: TextAlign.center,
                          DataStroge.userName.string,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.sp),
                        ),
                      ),
                      SizedBox(
                        width: 170.sp,
                        child: Text(
                          textAlign: TextAlign.start,
                          DataStroge.userEmail.string,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.sp),
                        ),
                      ),
                    ],
                  ),
                )),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Navigate to the home screen or perform any other action
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Bets'),
              onTap: () {
                Navigation.getInstance.screenNavigation(context, MyBetScreen());
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to the settings screen or perform any other action
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }
}
