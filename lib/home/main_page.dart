import 'package:flutter/material.dart';
import 'package:gas_pod/widgets/big_texts.dart';
import 'package:gas_pod/widgets/small_texts.dart';

import '../utils/colors.dart';
import 'gas_level_body.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top:45, bottom:15),
              padding: EdgeInsets.only(left:20, right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children:[
                      BigText(text: "GASPOD", size: 25, color: AppColors.mainColor,),
                      SmallText(text: "for a smarter life", )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.gas_meter_sharp, color:Colors.black),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child:GasLvlBody(),
          )),

        ],
      ),

    );
  }
}