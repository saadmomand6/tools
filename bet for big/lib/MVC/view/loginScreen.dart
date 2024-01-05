import 'package:bet_for_big/MVC/view/onboardingScreen.dart';
import 'package:bet_for_big/components/bottomNavigation.dart';
import 'package:bet_for_big/components/custom_textfiled.dart';
import 'package:bet_for_big/components/round_button.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/navigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:bet_for_big/helper/internet_controller.dart';
import 'package:bet_for_big/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final internetController = Get.put(InternetController());

  final _formkey = GlobalKey<FormState>();
  final emailConroller = TextEditingController();
  final PasswordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _EmailFocusNode = FocusNode();
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
              body: Form(
                key: _formkey,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg1.png'),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage('assets/images/logo.png'),
                              height: 100.sp,
                              width: 300.sp,
                              fit: BoxFit.contain),
                          SizedBox(
                            height: 20.sp,
                          ),
                          CustomTextFieldWidget(
                            textAlign: TextAlign.center,
                            controller: emailConroller,
                            hintText: 'Email Address',
                            inputType: TextInputType.name,
                            label: '',
                            validator: (value) {
                              if (value == '') {
                                return 'please enter Email Address';
                              }
                            },
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
                            validator: (value) {
                              if (value == '') {
                                return 'please enter Password';
                              }
                            },
                            enabled: true,
                            fieldColor:
                                themecontroller.colorPrimary.withOpacity(0.0),
                            focusNode: _passwordFocusNode,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Obx(
                            () => RoundButton(
                                height: 45.sp,
                                title: 'Log In',
                                loading: apihitting.value,
                                disabled: apihitting.value,
                                margin: 0,
                                backgroundColor:
                                    themecontroller.colorPrimary.withOpacity(0.0),
                                borderColor:
                                    const Color.fromARGB(255, 216, 215, 215),
                                onTap: () async {
                              if (_formkey.currentState!.validate()) {
                                    apihitting.value = true;
                                    await AppService.getInstance.Login(
                                        context,
                                        emailConroller.text,
                                        PasswordController.text);
                                  }
                                  apihitting.value = false;
                                }),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
