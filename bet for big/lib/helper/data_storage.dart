import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/app_service.dart';

class DataStroge extends GetxController {
  static DataStroge? _instance;
  static DataStroge get getInstance => _instance ??= DataStroge();
  late SharedPreferences _pref;

  late Map<String, dynamic> headersMap;

  Future<SharedPreferences> _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static RxString userName = ''.obs;
  static RxString userEmail = ''.obs;

  Future initiateSession() async {
    log("initiateSession called");
    await _initPrefs();
    headersMap = {
      'key': 'X-APP-KEY',
      'value': '123456',
    };

    AppService.getInstance.updateDioHeaders();
  }

  // insertUserData(UserModel UserData) async {
  //   final SharedPreferences? prefs = await _prefs;

  //   await prefs?.setString('name', UserData.name);
  //   await prefs?.setString('email', UserData.email);

  //   await initiateSession();
  //   userName.value = UserData.name;
  //   userEmail.value = UserData.email;
  // }

  // insertDeviceAndFCMInformation({FcmToken, deviceID}) async {
  //   final SharedPreferences? prefs = await _prefs;
  //   await prefs?.setString('fcmToken', FcmToken);
  //   await prefs?.setString('DeviceID', deviceID);

  //   fcmToken.value = FcmToken;
  //   DeviceID.value = deviceID;
  // }

  // Future setTokenAuth(String authToken) async {
  //   await _initPrefs();
  //   _pref.setString('token', authToken);
  //   await initiateSession();
  //   return true;
  // }

  // updateUserData({name, Phone, email, photo}) async {
  //   final SharedPreferences? prefs = await _prefs;

  //   if (photo != "") {
  //     await prefs?.setString('fullName', name);
  //     await prefs?.setString('email', email);
  //     await prefs?.setString('photo', photo);
  //     await prefs?.setString('phone_number', Phone);
  //     userName.value = name;
  //     userImage.value = photo;
  //     userEmail.value = email;
  //     userPhone.value = Phone;
  //   } else {
  //     await prefs?.setString('email', email);
  //     await prefs?.setString('fullName', name);
  //     await prefs?.setString('phone_number', Phone);
  //     userName.value = name;
  //     userEmail.value = email;
  //   }
  // }

  // getUserData() async {
  //   final SharedPreferences? prefs = await _prefs;

  //   userName.value = prefs?.getString('name') ?? "";

  //   userEmail.value = prefs?.getString('email') ?? "";

  //   // currentUserId.value = prefs?.getString('id') ?? "";
  // }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await initiateSession();

    userName.value = '';
    userEmail.value = '';
  }
}
