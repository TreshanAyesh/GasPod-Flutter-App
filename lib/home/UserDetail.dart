import 'package:flutter/material.dart';
import 'package:gas_pod/home/gasSettings.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:gas_pod/models/gas.dart';
import 'package:gas_pod/services/auth_service.dart';
import 'package:gas_pod/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/usermodel.dart';
import '../routes/route_helper.dart';
import '../services/database.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/loading.dart';
import '../widgets/big_texts.dart';
import '../widgets/small_texts.dart';
import '../utils/AppDetals.dart' as globals;


class UserDetailPage extends StatefulWidget {

  late String _username;


  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  final AuthServices _auth = AuthServices();


  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SettingsForm(),
            );
      });
    }

    final user = Provider.of<UserModel>(context);


    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
    if(snapshot.hasData){
      UserData? userdata = snapshot.data;


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

              SizedBox(height: 20,),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.mainColor)
                      )
                  ),
                  child: BigText(text: "USER INFO",color: AppColors.textColor2)
              ),
              SizedBox(height: 40,),
              Container(
                height: 100,
                width: 100,
                child: Icon(Icons.person_rounded,
                  size: 80,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 40,),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(

                        width: 3,
                        color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(

                      children: [
                        BigText(text: "User name :",color: AppColors.textColor2),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: SmallText(text: globals.USER_NAME, size: 20, color: Colors.black,),
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(

                        width: 3,
                        color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: BigText(text: "Email :",color: AppColors.textColor2),
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(

                        width: 3,
                        color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        BigText(text: "Gas cylinder weight :",color: AppColors.textColor2),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: SmallText(text: globals.GAS_WEIGHT.toString() + "kg", size: 20, color: Colors.black,),
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 70,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    //margin: EdgeInsets.only(left: Dimensions.width20),
                    child: ElevatedButton(
                      child: Text("Sign Out"),
                      onPressed: () async{
                        await _auth.signOut();
                      },),

                  ),
                  Container(
                    alignment: Alignment.center,
                    //margin: EdgeInsets.only(left: Dimensions.width20),
                    child: IconButton(
                      tooltip: "settings",
                      icon: Icon(Icons.settings),
                      iconSize: 40,
                      color: AppColors.mainColor,
                      onPressed: () => _showSettingsPanel(),
                    ),

                  ),

                ],
              ),
            ],
          )




      );
    }else{
      return Loading();
    }

      }
    );


  }
}