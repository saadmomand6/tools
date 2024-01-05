import 'package:bet_for_big/MVC/view/allSubscribedScreen.dart';
import 'package:bet_for_big/MVC/view/packgeScreen.dart';
import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/components/historyRecordCard.dart';
import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/components/searchTextfield.dart';
import 'package:bet_for_big/components/spring_widget.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/navigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/data/dummyData/mockData.dart';
import 'package:bet_for_big/helper/data_storage.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final internetController = Get.put(InternetController());
  final searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayStyleForwhite,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
       
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg2.png'),
                          fit: BoxFit
                              .cover, // Use BoxFit.cover instead of BoxFit.fill
                          colorFilter: ColorFilter.mode(
                            themecontroller.colorPrimary.withOpacity(0.9),
                            BlendMode.srcATop,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.screenPadding,
                            vertical: Constants.screenPadding),
                        child: Column(children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 41.sp,
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
                            height: 2.sp,
                          ),
                          SizedBox(
                            width: 150.sp,
                            child: Text(
                              textAlign: TextAlign.center,
                              // 'CALVIN KING'
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
                            height: 5.sp,
                          ),
                          SizedBox(
                            width: 250.sp,
                            child: Text(
                              textAlign: TextAlign.center,
                              DataStroge.userBio.string == ''
                                  ? 'No Bio Added'
                                  : DataStroge.userBio.string,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total bets:${50}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Wins:${50}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Losses:${50}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'win %:${50}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'ROI:${50}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.screenPadding,
                              vertical: Constants.screenPadding),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SUBSCRIBED PICKS',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: themecontroller.colorPrimary,
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.sp),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigation.getInstance.screenNavigation(
                                            context, SubscribedListScreen());
                                      },
                                      child: Text(
                                        'View All',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: themecontroller.colorPrimary,
                                            fontSize: 10.sp,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: Mockdata.subscriptionPickList
                                        .map((e) => Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.sp),
                                              child: pickCard(
                                                packageName: e['name'],
                                                stateName: e['stateName'],
                                                onTap: () {},
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'RECENTS PICKS',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: themecontroller.colorPrimary,
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.sp),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'View All',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: themecontroller.colorPrimary,
                                            fontSize: 10.sp,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: Mockdata.subscriptionPickList
                                        .map((e) => Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.sp),
                                              child: pickCard(
                                                packageName: e['name'],
                                                stateName: e['stateName'],
                                                onTap: () {},
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PACKAGES',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: themecontroller.colorPrimary,
                                          fontSize: 16.sp,
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.sp),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigation.getInstance.screenNavigation(
                                            context, packageScreen());
                                      },
                                      child: Text(
                                        'View All',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: themecontroller.colorPrimary,
                                            fontSize: 10.sp,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: packageCard()),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Expanded(flex: 1, child: packageCard()),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Expanded(flex: 1, child: packageCard()),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

class packageCard extends StatelessWidget {
  const packageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: () {},
        child: Container(
          // height: 100.sp,

          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 1,
                  offset: Offset(2, 8),
                ),
              ],
              border:
                  Border.all(color: themecontroller.colorPrimary, width: 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
            child: Column(children: [
              SizedBox(
                // width: 100.sp,
                child: Text(
                  'Daily package',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 1.sp),
                ),
              ),
              SizedBox(
                width: 120.sp,
                child: Text(
                  '${600}\$',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: themecontroller.colorPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.sp),
                ),
              ),
              Text(
                'Terms & Conditions\n Apply',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: themecontroller.colorPrimary.withOpacity(0.7),
                    fontSize: 6.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              ),
            ]),
          ),
        ),
      );
    });
  }
}

class pickCard extends StatelessWidget {
  const pickCard({
    super.key,
    required this.packageName,
    required this.stateName,
    required this.onTap,
    this.width,
    this.icon,
  });
  final String packageName;
  final String stateName;
  final Function() onTap;
  final double? width;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: onTap,
        child: Container(
          // height: 100.sp,
          width: width ?? 250.sp,
          decoration: BoxDecoration(
              border:
                  Border.all(color: themecontroller.colorPrimary, width: 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.sp,
                        child: Text(
                          packageName,
                          // 'Fancy Football League',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: themecontroller.colorPrimary,
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.sp),
                        ),
                      ),
                      Text(
                        'Bet on',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color:
                                themecontroller.colorPrimary.withOpacity(0.5),
                            fontSize: 7.sp,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.sp),
                      ),
                      SizedBox(
                        width: 150.sp,
                        child: Text(
                          stateName,
                          // 'New Mexico State',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.sp),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    icon ?? Icons.arrow_forward_ios_rounded,
                    color: themecontroller.colorPrimary,
                  )
                ]),
          ),
        ),
      );
    });
  }
}
