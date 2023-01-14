
import 'package:flutter/cupertino.dart';
import 'package:gas_pod/home/authenticate.dart';
import 'package:gas_pod/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/route_helper.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //return either Homepage or authenticate screen
    return Authenticate();
  }
}
