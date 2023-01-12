import 'package:flutter/material.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:get/get.dart';
import '../routes/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_texts.dart';
import '../widgets/small_texts.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
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
                    ),

                  ],
                ),
              ),
            ),
            //SizedBox(height: Dimensions.height30,),

            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: Dimensions.width50),
                  child: Row(

                    children: [
                      BigText(text: "USER INFO", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: Row(

                    children: [
                      BigText(text: "bringing safety & convenience for users", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: Dimensions.width30),
                  child: Row(

                    children: [
                      BigText(text: "who use gas cylinders in house holds.", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: Dimensions.width160),
                  child: Row(

                    children: [
                      BigText(text: "TEAM", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 120),
                  child: Row(

                    children: [
                      BigText(text: "Treshan Ayesh", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 110),
                  child: Row(

                    children: [
                      BigText(text: "Ashen Dulanjana", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 100),
                  child: Row(

                    children: [
                      BigText(text: "Shivanka Priyashan", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 110),
                  child: Row(

                    children: [
                      BigText(text: "Muditha Fernando", color: AppColors.mainColor,),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            SizedBox(height: Dimensions.height30,),
            Container(

              child:GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.initial);
                },
                child: (

                    Icon(Icons.arrow_circle_left_outlined,
                      size: 70,)
                ),
              ),
            )



          ],
        )

    );
  }
}