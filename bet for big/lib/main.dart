import 'dart:convert';
import 'dart:io';
import 'package:bet_for_big/MVC/view/welcomeScreen.dart';
import 'package:bet_for_big/components/bottomNavigation.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'constant/constants.dart';
import 'helper/data_storage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  DataStroge.getInstance.initiateSession();
  await DataStroge.getInstance.getUserData();
  loadConfig();
  runApp(const MyApp());
  Get.put(ThemeHelper());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: child,
        );
      },
      child:WelcomeScreen(),
      //  Obx(() => DataStroge.accessToken.value == '' ? WelcomeScreen() : BottomNavBar()),
    );
  }
}

Future<void> loadConfig() async {
  try {
    FlutterNativeSplash.remove();
    String configString = await rootBundle.loadString('config/config.json');
    Map<String, dynamic> configJson = json.decode(configString);
    Constants.API_HOST = configJson['api_host'];
  } catch (e) {
    print(e);
    print("Configuration file does not exists or is not valid");
    exit(0);
  }
}
