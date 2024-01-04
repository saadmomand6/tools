import 'package:bet_for_big/MVC/view/loginScreen.dart';
import 'package:bet_for_big/components/bottomNavigation.dart';
import 'package:bet_for_big/components/custom_textfiled.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/navigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterationScreen({super.key});

  final internetController = Get.put(InternetController());

  final _formkey = GlobalKey<FormState>();
  final emailConroller = TextEditingController();
  final ConfirmPasswordConroller = TextEditingController();
  final nameController = TextEditingController();
  final PasswordController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _EmailFocusNode = FocusNode();
  final FocusNode _ConfirmpasswordFocusNode = FocusNode();
  RxBool showpassword = false.obs;
  RxBool apihitting = false.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayWithPrimery,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg2.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      themecontroller.colorPrimary
                          .withOpacity(0.9), // Adjust the opacity as needed
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.sp, vertical: Constants.screenPadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.sp,
                        ),
                        Image(
                            image: AssetImage('assets/images/logo.png'),
                            height: 100.sp,
                            width: 300.sp,
                            fit: BoxFit.contain),
                        SizedBox(
                          height: 30.sp,
                        ),
                        Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                              color: Color.fromARGB(255, 211, 255, 248),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        CustomTextFieldWidget(
                          textAlign: TextAlign.center,
                          controller: nameController,
                          hintText: 'Name',
                          inputType: TextInputType.name,
                          label: '',
                          enabled: true,
                          fieldColor:
                              themecontroller.colorPrimary.withOpacity(0.0),
                          focusNode: _nameFocusNode,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        CustomTextFieldWidget(
                          textAlign: TextAlign.center,
                          controller: emailConroller,
                          hintText: 'Email Address',
                          inputType: TextInputType.name,
                          label: '',
                          enabled: true,
                          fieldColor:
                              themecontroller.colorPrimary.withOpacity(0.0),
                          focusNode: _EmailFocusNode,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        CustomTextFieldWidget(
                          textAlign: TextAlign.center,
                          controller: PasswordController,
                          hintText: 'Password',
                          inputType: TextInputType.name,
                          label: '',
                          enabled: true,
                          fieldColor:
                              themecontroller.colorPrimary.withOpacity(0.0),
                          focusNode: _passwordFocusNode,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        CustomTextFieldWidget(
                          textAlign: TextAlign.center,
                          controller: ConfirmPasswordConroller,
                          hintText: 'Confirm Password',
                          inputType: TextInputType.name,
                          label: '',
                          enabled: true,
                          fieldColor:
                              themecontroller.colorPrimary.withOpacity(0.0),
                          focusNode: _ConfirmpasswordFocusNode,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        RoundButton(
                          height: 45.sp,
                          title: 'continue',
                          margin: 0,
                          backgroundColor:
                              themecontroller.colorPrimary.withOpacity(0.0),
                          borderColor: const Color.fromARGB(255, 216, 215, 215),
                          onTap: () {
                            Navigation.getInstance
                                .Page_PushAndReplaceNavigationwithTransition(
                                    context, BottomNavBar());
                          },
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigation.getInstance
                                .screenNavigation(context, LoginScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: 'Login here',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ));
    });
  }
}
