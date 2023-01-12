import 'package:gas_pod/home/AboutApp.dart';
import 'package:gas_pod/home/home_page.dart';
import 'package:gas_pod/home/main_page.dart';
import 'package:get/get.dart';
import 'package:gas_pod/home/UserDetail.dart';

class RouteHelper{
  static const String initial = "/" ;
  static const String popularAbout = "/about-us";
  static const String userDetailPage = "/user-detail";

  static String getInitial() => '$initial';
  static String getPopularAbout()=>'$popularAbout';
  static String getUserDetailPage()=> '$userDetailPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: (){
      return HomePage();
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
  ];
  }
