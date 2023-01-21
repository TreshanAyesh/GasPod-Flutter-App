import 'package:flutter/material.dart';
import 'package:gas_pod/controller/slider_controller.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:gas_pod/home/gas_level_body.dart';
import 'package:gas_pod/home/splash_page.dart';
import 'package:gas_pod/routes/route_helper.dart';
import 'package:gas_pod/services/auth_service.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:gas_pod/helper/dependencies.dart' as dep;
import 'package:firebase_core/firebase_core.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';
import '../controller/gas_controller.dart';
import '../models/usermodel.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   return FutureBuilder(
       future : Firebase.initializeApp(),
        builder: (context, snapshot){
        return StreamProvider<UserModel?>.value(
            initialData: null,
          value: AuthServices().user,
          child: InAppNotification(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              //theme: ThemeData.dark(),
              //home: SplashScreen(),
              //home: MainPage(),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            ),
          ),
        );
      },
   );

  }
}
