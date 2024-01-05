import 'package:get/get.dart';
import 'package:three_sixty_kids/ui/blog_details_page/blog_detail_main_page.dart';
import 'package:three_sixty_kids/ui/center_details_page/center_detail_main_page.dart';
import 'package:three_sixty_kids/ui/class_details_page/class_detail_main_page.dart';
import 'package:three_sixty_kids/ui/home_page/home_main_page.dart';
import 'package:three_sixty_kids/ui/join_as_center_page/join_as_center_main_page.dart';
import 'package:three_sixty_kids/ui/join_as_center_page/join_as_center_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String centerDetails = "/center-detail";
  static const String classDetails = "/class-detail";
  static const String blogDetails = "/blog-detail";
  static const String joinAsCenter = "/join-as-center";

  static String getInitial() => "$initial";
  static String getCenterDetailsPage(int index)=> "$centerDetails?index=$index";
  static String getClassDetailsPage(int index)=> "$classDetails?index=$index";
  static String getBlogDetailPage(int index)=> "$blogDetails?index=$index";
  static String getJoinAsCenterPage()=> "$joinAsCenter";

  static List<GetPage> routes = [
    // initail
    GetPage(name: initial, page: () => HomeMainPage()),

    // center details
    GetPage(name: centerDetails, page: (){
      var index = Get.parameters["index"];
      return CenterDetailMainPage(index: int.parse(index ?? "0"));
    },
      transition: Transition.fadeIn,
    ),

    // class details
    GetPage(name: classDetails, page: (){
      var index = Get.parameters["index"];
      return ClassDetailMainPage(index: int.parse(index ?? "0"));
    },
      transition: Transition.fadeIn,
    ),

    // blog details
    GetPage(name: blogDetails, page: (){
      var index = Get.parameters["index"];
      return BlogDetailMainPage(index: int.parse(index ?? "0"));
    },
      transition: Transition.fadeIn,
    ),

    // join as center
    GetPage(name: joinAsCenter, page: (){
      return JoinAsCenterMainPage();
    },
      transition: Transition.fadeIn,
    ),

  ];
}
