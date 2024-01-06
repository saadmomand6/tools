import 'package:bet_for_big/MVC/view/historicalRecordNonSubScreen.dart';
import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/components/historyRecordCard.dart';
import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/components/searchTextfield.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/data/dummyData/mockData.dart';
import 'package:bet_for_big/helper/data_storage.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HistoryRecordSubScreen extends StatelessWidget {
  HistoryRecordSubScreen({super.key});

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
                  
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
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
                            "SUBSCRIBER PICKS",
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
                                      Obx(
                                        () => Text(
                                          textAlign: TextAlign.center,
                                          DataStroge.userName.string,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
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
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30.sp,
                              backgroundColor: themecontroller.colorPrimary,
                              child: Image.asset(
                                'assets/images/hookie.png',
                                height: 60.sp,
                              ),
                            ),
                            title: Text(
                              'NCAAB',
                              style: TextStyle(
                                  color: themecontroller.colorPrimary,
                                  fontSize: 14.sp),
                            ),
                            trailing: Column(children: [
                              Text(
                                'Bet Result',
                                style: TextStyle(
                                    color: themecontroller.colorPrimary,
                                    fontSize: 8.sp),
                              ),
                              Text(
                                'pending',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp),
                              ),
                            ]),
                          ),
                        );
                      },
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
