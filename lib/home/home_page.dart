import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_pod/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'AboutApp.dart';
import 'AboutApp2.dart';
import 'UserDetail.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages=[
    MainPage(),
    UserDetailPage(),
    AboutPage2(),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.blueGrey.shade900,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,
          vertical: 15),
          child: GNav(
            //backgroundColor: Colors.black,
            color: AppColors.mainColor,
            activeColor: Colors.black,
            tabBackgroundColor: AppColors.mainColor,
            gap: 8,
            padding: EdgeInsets.all(16) ,
            haptic: true,
            onTabChange: (index){
              onTapNav(index);
            },
            tabs: const [
              GButton(
                  icon: Icons.home_outlined,
                  text: "Home",),
              GButton(icon: Icons.perm_identity_outlined,
                  text:"user"),
              GButton(icon: Icons.search_outlined,
                  text:"Know more"),
            ],

          ),
        ),
      ),
    );
  }
}
