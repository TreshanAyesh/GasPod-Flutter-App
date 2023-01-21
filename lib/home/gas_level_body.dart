import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/controller/slider_controller.dart';
import 'package:gas_pod/models/usermodel.dart';
import 'package:gas_pod/routes/route_helper.dart';
import 'package:gas_pod/services/database.dart';
import 'package:gas_pod/utils/dimensions.dart';
import 'package:gas_pod/widgets/big_texts.dart';
import 'package:gas_pod/widgets/small_texts.dart';
import 'package:get/get.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../controller/gas_controller.dart';
import '../models/gas.dart';
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import '../utils/loading.dart';
import 'AboutApp.dart';
import '../utils/AppDetals.dart' as globals;

class GasLvlBody extends StatefulWidget {
  const GasLvlBody({Key? key}) : super(key: key);

  @override
  State<GasLvlBody> createState() => _GasLvlBodyState();
}

class _GasLvlBodyState extends State<GasLvlBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  //final gaslvl = FirebaseDatabase.instance.ref();

  var currPageval = 0.0;
  double scaleFactor = 0.8;
  double height = 180;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageval = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return StreamBuilder<UserData?>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          UserData? userdata = snapshot.data;

          //double ? gl1;
          double? gaslevel ;
          double? leaklvl;

          double? gl_ratio;

          if(userdata?.gaslvl != null){
            gaslevel = userdata?.gaslvl;
            gaslevel = (gaslevel !/ globals.GAS_WEIGHT);
            String? gl = gaslevel.toStringAsFixed(2);
            gl_ratio = double.parse(gl);

          }else{
            gl_ratio = 0;

          }
          if(userdata?.leaklvl != null){
            leaklvl = userdata?.leaklvl;

          }
          else{
            leaklvl = 0;
          }

          List datalist = [gl_ratio, leaklvl];
          List stringList = [(gaslevel! * globals.GAS_WEIGHT) .toString() + 'kg', leaklvl.toString() ];



          if(gl_ratio < 0.3 && globals.GAS_WEIGHT != -1 && datalist[1] < 0.6 && gl_ratio> 0.1){
            InAppNotification.show(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Error.svg/1200px-Error.svg.png",
                      width: 100,
                      height: 100,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context,url,error) => Icon(Icons.error_outlined),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            SmallText(text: "Your Remaining gas level is low",
                            size: 20,
                            color: AppColors.mainColor,)
                          ],
                        ),
                      ),

                                ),
                  ]
                            )
                        ),
                      ),




                
        context: context,
            );
          }


          if(leaklvl! > 0.6 && globals.GAS_WEIGHT != -1 ){
            InAppNotification.show(
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Error.svg/1200px-Error.svg.png",
                            width: 100,
                            height: 100,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context,url,error) => Icon(Icons.error_outlined),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SmallText(text: "Danger! A gas leak detected",
                                    size: 20,
                                    color: AppColors.mainColor,)
                                ],
                              ),
                            ),

                          ),
                        ]
                    )
                ),
              ),





              context: context,
            );
          }
          if(leaklvl > 0.6 && globals.GAS_WEIGHT != -1 && gl_ratio < 0.3 ){
            InAppNotification.show(
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Error.svg/1200px-Error.svg.png",
                            width: 100,
                            height: 100,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context,url,error) => Icon(Icons.error_outlined),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SmallText(text: "Danger! A gas leak detected",
                                    size: 20,
                                    color: AppColors.mainColor,)
                                ],
                              ),
                            ),

                          ),
                        ]
                    )
                ),
              ),





              context: context,
            );
          }
          return Column(
            children: [
              //Slider section
              Container(
                //color: Colors.redAccent,
                height: Dimensions.pageViewContainer,
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> AboutPage());
                  },
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position);
                      }),
                ),

              ),


              //dots

              DotsIndicator(
                dotsCount: 5,
                position: currPageval,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),


              //Gas level indicators
              SizedBox(height: Dimensions.height30,),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width30),
                child: Row(
                  children: [
                    BigText(text: "DASHBOARD", color: AppColors.mainColor,)
                  ],
                ),
              ),

              //SizedBox(height: Dimensions.height10,),
              //dashboard list view
              Container(
                  height: Dimensions.dashboardHeight,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index){
                        return Container(
                            alignment: Alignment.topCenter,
                            height: Dimensions.containerHeight,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: Colors.black12
                              ),
                              borderRadius: BorderRadius.circular(Dimensions.borderradius),
                              //color: Color(0xFFf2f2f2),

                            ),

                            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  //color: Colors.redAccent,
                                  //width: 120,

                                  margin: EdgeInsets.only(left: Dimensions.width20),
                                  child: Row(
                                    children: [
                                      index == 0?

                                      BigText(text: "GAS LEVEL",color: AppColors.textColor2):
                                      BigText(text: "GAS LEAKAGE LEVEL",color: AppColors.textColor2),
                                    ],
                                  ),
                                ),

                                //Graph Section
                                Container(
                                  //color: Colors.redAccent,
                                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,top: Dimensions.height15),
                                  child: CircularPercentIndicator(
                                    animateFromLastPercent: true,
                                    animation: true,
                                    animationDuration: 1000,
                                    radius: Dimensions.graphradius120,
                                    lineWidth: Dimensions.graphwidth,
                                    percent: globals.GAS_WEIGHT != -1 ? index == 0 ? datalist[index]
                                        :datalist[index]  : 0,
                                    progressColor: index == 0 ?
                                      datalist[index] > 0.3? Colors.deepPurple : Colors.red.shade800:
                                        datalist[index] <0.6 ? Colors.deepPurple : Colors.red.shade800,
                                    backgroundColor: index == 0?
                                      datalist[index] > 0.3? Colors.deepPurple.shade100 : Colors.red.shade200:
                                        datalist[index] < 0.6? Colors.deepPurple.shade100 : Colors.red.shade200,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: globals.GAS_WEIGHT != -1 ? BigText(text:stringList[index],color: AppColors.textColor2)
                                    : Text("Please enter a valid gas cylinder weight first"),
                                  )



                                  ,)

                              ],
                            )
                        );
                      })
              )



            ],
          );
        }else{
          return Loading();
        }

      }
    );
  }

  List images = [ "assets/image/img3.png",
                  "assets/image/img2.png",
                  "assets/image/img1.jpg",
                  "assets/image/img4.jpg",
                  "assets/image/img5.jpg"];

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == currPageval.floor()){
      var currScale = 1 - (currPageval - index)* (1 - scaleFactor);
      var currTrans = height*(1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == currPageval.floor() + 1){
      var currScale = scaleFactor+(currPageval - index + 1)*(1-scaleFactor);
      var currTrans = height*(1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == currPageval.floor() - 1){
      var currScale = 1 - (currPageval - index)* (1 - scaleFactor);
      var currTrans = height*(1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, height*(1-scaleFactor)/2, 0);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(

            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF69c5df),
                boxShadow: [BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0,15)
            ),
            ],
                image:DecorationImage(
                    alignment: Alignment.centerRight,
                    fit: BoxFit.cover,
                    image:AssetImage(
                          images[index]


                    )
                )
            ),
          )
        ],
      ),
    );

  }
}
