import 'dart:developer';
import 'package:bet_for_big/constant/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constant/navigation.dart';
import '../helper/data_storage.dart';

class AppService {
  static AppService? _instance;
  static AppService get getInstance => _instance ??= AppService();

  late Dio dio;
final _pref = DataStroge();
  AppService() {
    // log("headerMap: ${DataStroge.getInstance.headersMap}");
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.API_HOST,
        headers: DataStroge.getInstance.headersMap,
      ),
    );
    // print("[AppService] ${DataStroge.getInstance.headersMap}");
  }
  void updateDioHeaders() {
    if (dio != null) {
      // dio.options.headers = DataStroge.getInstance.headersMap;
    }
  }



//  Future<void> Login(
//       BuildContext context, String Email, String password) async {
//     try {

//       var response = await dio.get(Constants.PostLogin, data: {
//         'emailaddress': Email,
//         'password': password,
//       });

//       if (response.statusCode == 200) {
//         log("login API =>${response.data['success']}👌✅");
//         final json = response.data;

//         UserModel UserData = UserModel.fromJson(json['data']);

//         log("userEmail ${UserData.email}");
//         log("username ${UserData.name}");
//         await _pref.insertUserData(UserData);
//         FlutterToastDisplay.getInstance.showToast("Welcome To the AUTOREPAIR");
//         Navigation.getInstance
//             .pagePushAndReplaceNavigation(context, BottomNavBar());
//       } else {
//         print('Unknown Error Occurred ${(response.data['message'])} ');
//         FlutterToastDisplay.getInstance
//             .showToast("${response.data['message']}");
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         FlutterToastDisplay.getInstance
//             .showToast("${e.response!.data['message']}");
//         print("Error msg data: ${e.response!.data['message']}");
//       } else {
//         print("Error sending data: $e");
//       }
//       print(e);
//     }
//   }






//     getAllInspectionCars() async {
//     try {
//       Response response;
//       response = await dio.get(Constants.getAllInspectionCars,
//          data: {
//           'offset':0,
//           'limit':10
//          });

//       print("statusCode => " + response.statusCode.toString());
//       print('getAllproducts API done 👌✅');
//       print(response.data['data']);
//       if (response.statusCode == 200) {
//         final responseData = response.data;
//         if (responseData is List) {
//           List<CarInspectionModel> Productlist = (response.data as List)
//               .map((data) => CarInspectionModel.fromJson(data))
//               .toList();
              
//           return Productlist;
//         } else if (responseData is Map) {
//           List<CarInspectionModel> Productlist = (responseData['data'] as List)
//               .map((data) => CarInspectionModel.fromJson(data))
//               .toList();


//           return Productlist;
         
//         }
//       }
      
//     } on DioException catch (e) {
//       print(e);
//       FlutterToastDisplay.getInstance
//             .showToast("${e.response!.data['message']}");
//       return [];
//     }
//   }
}
