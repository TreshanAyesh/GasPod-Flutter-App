
import 'package:flutter/cupertino.dart';
import 'package:gas_pod/home/authenticate.dart';
import 'package:gas_pod/home/home_page.dart';
import 'package:gas_pod/models/usermodel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../routes/route_helper.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);


    //return either Homepage or authenticate screen
    if (user == null){
      return Authenticate();
    }else{
      return HomePage();
    }
  }
}
