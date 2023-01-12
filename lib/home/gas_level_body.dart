import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/controller/slider_controller.dart';
import 'package:gas_pod/routes/route_helper.dart';
import 'package:gas_pod/utils/dimensions.dart';
import 'package:gas_pod/widgets/big_texts.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controller/gas_controller.dart';
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import 'AboutApp.dart';

class GasLvlBody extends StatefulWidget {
  const GasLvlBody({Key? key}) : super(key: key);

  @override
  State<GasLvlBody> createState() => _GasLvlBodyState();
}

class _GasLvlBodyState extends State<GasLvlBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
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
    return Column(
      children: [
        //Slider section
        GetBuilder<dataController>(builder: (popular){
          return popular.isLoaded? Container(
            //color: Colors.redAccent,
            height: Dimensions.pageViewContainer,
            child: GestureDetector(
              onTap: (){
                Get.to(()=> AboutPage());
              },
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popular.gaslvllist.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position,popular.gaslvllist[position]);
                  }),
            ),

          )
              :CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        //dots
        GetBuilder<dataController>(builder: (popular){
          return DotsIndicator(
            dotsCount: popular.gaslvllist.length<=0?1:popular.gaslvllist.length,
            position: currPageval,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

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
                        GetBuilder<gasController>(
                            builder: (gascontroller){
                              return gascontroller.isLoaded?Container(
                              //color: Colors.redAccent,
                              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,top: Dimensions.height15),
                              child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              radius: Dimensions.graphradius120,
                              lineWidth: Dimensions.graphwidth,
                              percent: gascontroller.gasDatalist[index].value,
                              progressColor: Colors.deepPurple,
                              backgroundColor: Colors.deepPurple.shade100,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: BigText(text:gascontroller.gasDatalist[index].description!,color: AppColors.textColor2),
                              )
                              )
                        : CircularProgressIndicator(
                          color: AppColors.mainColor,
                );
                }
                    ,)

                      ],
                    )
                );
              })
        )



      ],
    );
  }

  Widget _buildPageItem(int index, gasdata){
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
                    image:NetworkImage(
                        //AppConstants.BASE_URL+"/uploads/"+ gasdata.img!
                        "https://thumbs.dreamstime.com/z/gas-cylinder-red-isolated-white-42475117.jpg"

                    )
                )
            ),
          )
        ],
      ),
    );

  }
}
