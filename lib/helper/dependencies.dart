import 'package:gas_pod/data/api/api_client.dart';
import 'package:gas_pod/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/slider_controller.dart';
import '../controller/gas_controller.dart';
import '../data/repository/gasdata_repo.dart';
import '../data/repository/slider_repo.dart';


Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => gasRepo(apiClient:Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => gasController(gasDataRepo:Get.find()));
}