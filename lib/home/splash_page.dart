import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/gas_controller.dart';
import '../controller/slider_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async{
    await Get.find<dataController>().getGaslvlList();
    await Get.find<gasController>().getGasDataList();
  }

  @override
  void initState(){
    super.initState();
    _loadResources();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();

    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate);

    Timer(
      const Duration(seconds: 3),
            ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
              child: Center(
                  child: Image.asset("assets/image/logo1.png",
                    width: 250,)))
        ],
      )
    );
  }
}
