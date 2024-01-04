import 'package:bet_for_big/MVC/view/historicalRecordsScreen.dart';
import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/components/historyRecordCard.dart';
import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/components/searchTextfield.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/data/dummyData/mockData.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
              appBar: CustomAppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.sp,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.screenPadding),
                    child: Text(
                      'FEATURED HANDICAPPERS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 20.sp),
                            child: Container(
                              width: 100.sp,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.1)),
                              child: Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20.sp,
                                      ),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Text(
                                        'Calvin King',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        'wins: ${400}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Text(
                                        'Losses: ${80}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Text(
                                        'Units Won: ${400}U',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Text(
                                        'ROI: ${40}%',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 400.sp,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.screenPadding,
                              vertical: Constants.screenPadding),
                          child: Column(children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                textAlign: TextAlign.center,
                                "LEADERBOARD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3),
                              ),
                            ),
                            
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: Mockdata.LeaderboardBtnList.map(
                                        (e) => FilterBtn(title: e['Title']))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                height: 100.sp,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return leaderboardCard();
                                  },
                                ),
                              ),
                            ),
                          ])),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

class leaderboardCard extends StatelessWidget {
  const leaderboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themecontroller.cardcolor.withOpacity(0.7)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(children: [
                    CircleAvatar(
                        backgroundColor:
                            themecontroller.colorPrimary.withOpacity(0.9),
                        radius: 35.sp,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14.sp,
                          child: Image.asset('assets/images/football.png',
                              fit: BoxFit.fill),
                        )),
                    Positioned(
                        right: 3,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 27, 203, 243),
                          radius: 13.sp,
                          child: Text(
                            textAlign: TextAlign.center,
                            "01",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 3),
                          ),
                        ))
                  ]),
                  Text(
                    textAlign: TextAlign.center,
                    "Calvin King",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 50.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'win%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        '96%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'ROI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'win%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        '96%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'ROI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
