import 'package:bet_for_big/components/custom_appbar.dart';
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

class HistoryRecordScreen extends StatelessWidget {
  HistoryRecordScreen({super.key});

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
                centerTitle: false,
                leading: SizedBox(),
                title: Container(
                  height: 50.sp,
                  width: 240.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              body: Column(
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
                          "HISTORICAL RECORDS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: Mockdata.FilterBtnList.map(
                              (e) => FilterBtn(title: e['Title'])).toList(),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: searchTextFeild(
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
                                    Icon(
                                      Icons.filter_alt_sharp,
                                      color: Colors.white,
                                    )
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
                      child: Row(children: [
                        CircleAvatar(
                          radius: 40.sp,
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'NCAAB',
                              style: TextStyle(
                                color: themecontroller.colorPrimary
                                    .withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.sp,
                            ),
                            SizedBox(
                              width: 70.sp,
                              child: Text(
                                'calvin king',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              'Bat on',
                              style: TextStyle(
                                color: themecontroller.colorPrimary
                                    .withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'category Flames',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 8.sp,
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
                              'NCAAB',
                              style: TextStyle(
                                color: themecontroller.colorPrimary
                                    .withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.sp,
                            ),
                            SizedBox(
                              width: 70.sp,
                              child: Text(
                                'calvin king',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              'Bat on',
                              style: TextStyle(
                                color: themecontroller.colorPrimary
                                    .withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'category Flames',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}

class emptyHistoryRecord extends StatelessWidget {
  const emptyHistoryRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.screenPadding),
        child: Column(
          children: [
            SizedBox(
              height: 30.sp,
            ),
            SvgPicture.asset(
              'assets/icons/subscription.svg',
              color: themecontroller.colorPrimary,
              height: 120.sp,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              textAlign: TextAlign.center,
              "subscription Required For More Records & Picks",
              style: TextStyle(
                  color: themecontroller.colorPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3),
            ),
            SizedBox(
              height: 30.sp,
            ),
            RoundButton(
              height: 50.sp,
              title: 'Subscribe Now',
              textColor: themecontroller.colorPrimary,
              backgroundColor: Colors.white,
              borderColor: themecontroller.colorPrimary,
              onTap: () {},
            )
          ],
        ),
      );
    });
  }
}

class FilterBtn extends StatelessWidget {
  const FilterBtn({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Container(
        width: 50.sp,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ], color: themecontroller.cardcolor),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 8.sp),
        ),
      );
    });
  }
}
