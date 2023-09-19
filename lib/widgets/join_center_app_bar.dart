import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/helper/route_helper.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';

AppBar JoinAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Container(
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10,
        ),
        width: Dimensions.width100 + Dimensions.width30,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: (){
          Get.find<JoinCenterController>();
          Get.toNamed(RouteHelper.joinAsCenter);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.height8,
            horizontal: Dimensions.width10,
          ),
          child: CustomTextButton(
            text: joinAsCenter,
            padding: Dimensions.width20,
          ),
        ),
      ),
    ],
  );
}
