import 'package:bet_for_big/MVC/view/profileScreen.dart';
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

class packageScreen extends StatelessWidget {
  packageScreen({super.key});

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
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.screenPadding,
                            vertical: Constants.screenPadding),
                        child: Column(children: [
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "OUR PACKAGES",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 3),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          searchTextFeild(
                              FontSize: 10.sp,
                              height: 35.sp,
                              searchFocusNode: _searchFocusNode,
                              searchController: searchController),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: searchTextFeild(
                                    btnIcon: Icons.arrow_drop_down,
                                    FontSize: 10.sp,
                                    height: 35.sp,
                                    searchFocusNode: _searchFocusNode,
                                    searchController: searchController),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 35.sp,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "search by filter",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/filter.svg',
                                        color: Colors.white,
                                        height: 25.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ]),
                      ),
                    ),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.screenPadding,
                          vertical: Constants.screenPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20.sp,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "JOE SMITH",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Wins: ${20}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Losses: ${20}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Units won: ${20}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "ROI: ${20}%",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w400,
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
                                children: [
                                  packageCard(),
                                  packageCard(),
                                  packageCard(),
                                ],
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
