
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/services/auth_service.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_texts.dart';
import '../widgets/small_texts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 100, left: 18),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/image/logo1.png"
                      )
                  )
              ),
            ),

            Row(
              children: [
                Center(
                  child: Container(

                    margin: EdgeInsets.only(left: 165, right: 100),
                    child: Row(

                      children: [
                        BigText(text: "Sign In", color: AppColors.mainColor,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: ElevatedButton(
                      child: Text("Sign In"),
                      onPressed: () async{
                        dynamic result = await _auth.signInAnon();

                        if (result == null){
                          print("error signing in");
                        }else{
                          print("signed in");
                          print("userid: " + result.uid.toString());
                        }
                      },),

                    )



                    ],
                  ),

              ],

        ),




        );

  }
}
