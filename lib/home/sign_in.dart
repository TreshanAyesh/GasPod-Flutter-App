
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_pod/services/auth_service.dart';
import 'package:gas_pod/utils/loading.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_texts.dart';
import '../widgets/small_texts.dart';

class SignIn extends StatefulWidget {

  final toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 180, left: 18),
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/image/logo1.png"
                        )
                    )
                ),
              ),
              SizedBox(height: 20),

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

              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey.shade400),
                                suffixIcon: Icon(Icons.email),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 2)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.mainColor, width: 2)
                                ),
                              ),
                              validator: (val) => val!.isEmpty? 'Enter an email': null,
                              onChanged: (val){
                                setState(()=> email = val);
                              },
                            ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              suffixIcon: Icon(Icons.password),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor, width: 2)
                              ),
                            ),
                            validator: (val) => val!.length < 6? 'Password should have atleast 6 characters': null,
                            obscureText: true,
                            onChanged: (val){
                              setState(()=> password = val);
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () async{
                                if (_formKey.currentState!.validate()){
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signinWithEmailandPw(
                                        email, password);

                                  if(result == null){
                                    setState(() {
                                      error = "Unable to Sign In";
                                      loading = false;
                                    });

                                  }
                                }

                              },
                              child: Text("Sign In"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                              ),

                          )


                        ],
                      ),
                    ),

                      ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(),
                        child: InkWell(
                          onTap: () {widget.toggleView();},

                          child: Text("or SignUp",
                            style: TextStyle(decoration: TextDecoration.underline,
                            color: AppColors.mainColor),),
                        )

                        ),
                        ],
                      ),





                      ],
                    ),
              SizedBox(height: 12,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )

                ],

          ),
        ),




        );

  }
}
