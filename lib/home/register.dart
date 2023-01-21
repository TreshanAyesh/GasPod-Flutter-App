import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/loading.dart';
import '../widgets/big_texts.dart';

class Register extends StatefulWidget {

  final toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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

            SizedBox(height: 20),

            Row(
              children: [
                Center(
                  child: Container(

                    margin: EdgeInsets.only(left: 160, right: 100, top: 150),
                    child: Row(

                      children: [
                        BigText(text: "Sign Up", color: AppColors.mainColor,),

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
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
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
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async{
                            if (_formKey.currentState!.validate()){
                              setState(() => loading = true);
                              dynamic result = await _auth.registerWithEmailandPw(
                                  email , password);
                              if(result == null){
                                setState(()=>error = "Unable to Sign up");
                                setState(() => loading = false);

                              }
                            }

                          },
                          child: Text("Register"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                          ),

                        )


                      ],
                    ),
                  ),

                )



              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: Dimensions.width20),
                    child: InkWell(
                      onTap: (){
                        widget.toggleView();
                      },
                      child: Text("Sign In if already signed up",
                        style: TextStyle(decoration: TextDecoration.underline,
                            color: AppColors.mainColor),),
                    )

                ),
              ],
            ),
            SizedBox(height: 20,),
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
