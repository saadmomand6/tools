import 'package:bet_for_big/components/custom_appbar.dart';
import 'package:bet_for_big/components/myActionCard.dart';
import 'package:bet_for_big/components/searchTextfield.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/mybehavior.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyActionScreen extends StatelessWidget {
  MyActionScreen({super.key});

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
              appBar: CustomAppBar(onTap: () {
                
              },),
              body: SingleChildScrollView(
                
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg2.png'),
                      fit: BoxFit.cover,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.sp,
                        ),
                        searchTextFeild(
                          searchFocusNode: _searchFocusNode,
                          searchController: searchController,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'GAME',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '1H',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '2H',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '1Q',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '2Q',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '4Q',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: themecontroller.textcolor,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                        Container(
                          height: 460.sp,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return MyActionCard();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
