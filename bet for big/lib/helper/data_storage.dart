import 'dart:developer';
import 'package:bet_for_big/MVC/model/UserModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/app_service.dart';

class DataStroge extends GetxController {
  static DataStroge? _instance;
  static DataStroge get getInstance => _instance ??= DataStroge();
  late SharedPreferences _pref;

  // late Map<String, dynamic> headersMap;

  Future<SharedPreferences> _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static RxString userId = ''.obs;
  static RxString userName = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userImage = ''.obs;
  static RxString userphone = ''.obs;
  static RxString userBio = ''.obs;
  static RxString userType = ''.obs;
  static RxString accessToken = ''.obs;

  Future initiateSession() async {
    log("initiateSession called");
    await _initPrefs();
    // headersMap = {
    //   'key': 'X-APP-KEY',
    //   'value': '123456',
    // };

    AppService.getInstance.updateDioHeaders();
  }

  // static RxInt userId = 0.obs;
  // static RxString userName = ''.obs;
  // static RxString userEmail = ''.obs;
  // static RxString userImage = ''.obs;
  // static RxString userphone = ''.obs;
  // static RxString userBio = ''.obs;
  // static RxString userType = ''.obs;
  // static RxString accessToken = ''.obs;

  insertUserData(AuthResponse UserData) async {
    final SharedPreferences? prefs = await _prefs;

    await prefs?.setString('userId', UserData.data.id.toString());
    await prefs?.setString('userName', UserData.data.name);
    await prefs?.setString('userEmail', UserData.data.email);
    await prefs?.setString('userImage', UserData.data.image);
    await prefs?.setString('userphone', UserData.data.phone ?? '');
    await prefs?.setString('userBio', UserData.data.bio ?? '');
    await prefs?.setString('userType', UserData.data.userType);
    await prefs?.setString('accessToken', UserData.accessToken);

    await initiateSession();
    userId.value = UserData.data.id.toString();
    userName.value = UserData.data.name;
    userEmail.value = UserData.data.email;
    userImage.value = UserData.data.image;
    userphone.value = UserData.data.phone ?? '';
    userBio.value = UserData.data.bio ?? '';
    userType.value = UserData.data.userType;
    accessToken.value = UserData.accessToken;
  }

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

  getUserData() async {
    final SharedPreferences? prefs = await _prefs;

    userId.value = prefs?.getString('userId') ?? "";
    userEmail.value = prefs?.getString('userEmail') ?? "";
    userName.value = prefs?.getString('userName') ?? "";
    userphone.value = prefs?.getString('userImage') ?? "";
    userImage.value = prefs?.getString('userphone') ?? "";
    userBio.value = prefs?.getString('userBio') ?? "";
    userType.value = prefs?.getString('userType') ?? "";
    accessToken.value = prefs?.getString('accessToken') ?? "";
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await initiateSession();

    userName.value = '';
    userEmail.value = '';
  }
}
