import 'package:flutter/material.dart';
import 'package:gas_pod/controller/slider_controller.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:gas_pod/home/gas_level_body.dart';
import 'package:gas_pod/routes/route_helper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:gas_pod/helper/dependencies.dart' as dep;

import '../controller/gas_controller.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<dataController>().getGaslvlList();
    Get.find<gasController>().getGasDataList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      //home: MainPage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
