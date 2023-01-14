import 'package:gas_pod/home/AboutApp.dart';
import 'package:gas_pod/home/home_page.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:gas_pod/home/wrapper.dart';
import 'package:get/get.dart';
import 'package:gas_pod/home/UserDetail.dart';

import '../home/splash_page.dart';

class RouteHelper{
  static const String initial = "/" ;
  static const String popularAbout = "/about-us";
  static const String userDetailPage = "/user-detail";
  static const String splashPage = "/splash-page";

  static String getInitial() => '$initial';
  static String getPopularAbout()=>'$popularAbout';
  static String getUserDetailPage()=> '$userDetailPage';
  static String getSplashPage()=> '$splashPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: (){
      return Wrapper();
      },
      transition: Transition.fadeIn
    ),

    GetPage(name: popularAbout, page: (){
      return AboutPage();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: userDetailPage, page: (){
      return UserDetailPage();
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: splashPage, page:()=>SplashScreen()),
  ];
  }
