// import 'package:get/get.dart';

// import 'package:mechanic_app/MVC/model/CarInspectionModel.dart';
// import 'package:mechanic_app/services/app_service.dart';

// class homeController extends GetxController {
//   final RxList<CarInspectionModel> carInspectionlist =
//       <CarInspectionModel>[].obs;
//   final RxBool Isloading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getAllInspectionCars();
//   }
//   getAllInspectionCars() async {
//     try {
//       Isloading.value = true;
//       var serverResponse = await AppService.getInstance.getAllInspectionCars();
//       carInspectionlist.addAll(serverResponse);

//       print('CarInspectionlist count :${carInspectionlist.length}');
//       Isloading.value = false;
//     } catch (e) {
//       print('error in getAllInspectionCars: $e');
//       Isloading.value = false;
//       return [];
//     }
//   }
// }
