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

class MyBetScreen extends StatelessWidget {
  MyBetScreen({super.key});

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
              appBar: AppBar(
                  title: Text(
                'My Bets',
                style: TextStyle(
                    color: themecontroller.colorPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              )),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.screenPadding),
                      child: Column(
                        children: [
                          Container(
                            height: 40.sp,
                            // width: 30.sp,
                            decoration: BoxDecoration(
                                gradient: themecontroller.containerGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(
                                //   'assets/icons/tracking.svg',
                                //   color: Colors.white,
                                //   height: 25.sp,
                                // ),
                                Text(
                                  'TRACK YOUR BETS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.center,
                              "MY BETS",
                              style: TextStyle(
                                  color: themecontroller.colorPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: betCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: betCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: betCard(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.center,
                              "NET UNITS",
                              style: TextStyle(
                                  color: themecontroller.colorPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitCard(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.center,
                              "NET UNITS BY LEAGUES",
                              style: TextStyle(
                                  color: themecontroller.colorPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitLeagueCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitLeagueCard(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: UnitLeagueCard(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
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

class betCard extends StatelessWidget {
  const betCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: () {},
        child: Container(
          // height: 100.sp,
          width: 130.sp,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: themecontroller.colorPrimary, width: 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                // width: 100.sp,
                child: Text(
                  'UTAH STATE - (230)',
                  // textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.sp),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MONEYLNE',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: themecontroller.colorPrimary.withOpacity(0.7),
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  ),
                  Text(
                    '4U',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                'team A name',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 8.sp,
                    // fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              ),
              Text(
                'vs',
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
              Text(
                'team B name',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 8.sp,
                    // fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              ),
              Text(
                'pending',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: themecontroller.colorPrimary,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.sp),
              ),
            ]),
          ),
        ),
      );
    });
  }
}

class UnitCard extends StatelessWidget {
  const UnitCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: () {},
        child: Container(
          // height: 100.sp,
          width: 100.sp,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: themecontroller.colorPrimary, width: 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                // width: 100.sp,
                child: Text(
                  'All Time',
                  // textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.sp),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                '30U',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: themecontroller.colorPrimary,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'W/L%',
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
                  Text(
                    'ROI %',
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '30%',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  ),
                  Text(
                    '30%',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  ),
                ],
              ),
            ]),
          ),
        ),
      );
    });
  }
}

class UnitLeagueCard extends StatelessWidget {
  const UnitLeagueCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: () {},
        child: Container(
          // height: 100.sp,
          width: 100.sp,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: themecontroller.colorPrimary, width: 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
            child:
                Column( children: [
              CircleAvatar(
                radius: 10.sp,
              ),
              SizedBox(height: 10.sp,),
              SizedBox(
                // width: 100.sp,
                child: Text(
                  '${'italy'} - ${'Serie A'}',
                  // textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.sp),
                ),
              ),
              SizedBox(height: 10.sp,),
              Text(
                '30U',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: themecontroller.colorPrimary,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.sp),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                  '${200} - ${105}',
                  // textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.sp),
                ),
              
            ]),
          ),
        ),
      );
    });
  }
}
