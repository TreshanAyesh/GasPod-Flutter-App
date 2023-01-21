import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/services/database.dart';
import 'package:gas_pod/utils/colors.dart';
import 'package:gas_pod/utils/loading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/usermodel.dart';
import '../utils/dimensions.dart';
import '../utils/AppDetals.dart' as globals;

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  late String _username ;
  late double _gasweight;




  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userdata = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Change your gas cylinder weight (kg)",
                  style: TextStyle(fontFamily: "Roboto" ,fontSize: 18,
                      color: AppColors.mainColor ),
                ),
                SizedBox(height: 50,),
                TextFormField(
                  initialValue: globals.USER_NAME,
                  decoration: InputDecoration(
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: Icon(Icons.person_rounded),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor, width: 2)
                    ),
                  ),
                  validator: (val) => val!.isEmpty? 'Please enter a name':null,
                  onChanged: (val) => setState(() => globals.USER_NAME = val),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue: globals.GAS_WEIGHT.toString(),
                  decoration: InputDecoration(
                    hintText: "Gas weight",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: Icon(Icons.gas_meter_sharp),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor, width: 2)
                    ),
                  ),
                  validator: (val) => val!.isEmpty?'Please enter a value':null,
                  onChanged: (val) => setState(() => globals.GAS_WEIGHT =  double.tryParse(val) ?? 0.0,),
                ),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: Dimensions.width20),
                    child: ElevatedButton(
                      child: Text("Update"),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(

                              userdata?.gaslvl,
                              userdata?.leaklvl,
                              );
                          Navigator.pop(context);
                        }
                      },),

                  ),
                ),
              ],
            ),
          );
        }else{
            return Loading();
        }


      }
    );
  }
}
