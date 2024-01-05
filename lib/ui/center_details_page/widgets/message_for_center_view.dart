import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';

class MessageForCenterView extends StatelessWidget {
  const MessageForCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.height100 + Dimensions.height10,
      color: AppColors.blueColor,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height10 / 2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10
              ),
              child: Row(
                children: [
                  AppIcon(
                    icon: Icons.add_alert_rounded,
                    iconColor: Colors.white,
                    size: Dimensions.height40,
                    iconSize: Dimensions.iconSize16,
                    radius: Dimensions.radius8,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                  SizedBox(width: Dimensions.width10,),
                  IntrinsicWidth(
                    child: CustomTextButton(
                      height: Dimensions.height40,
                      color: Colors.white.withOpacity(0.1),
                      text: "This message is for Center ONLY!",
                      textColor: Colors.white,
                      fontSize: Dimensions.font12,

                    ),
                  ),
                  SizedBox(width: Dimensions.width10,),
                  BigText(
                    text: "Claim your center here",
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    size: Dimensions.font12,
                  ),
                  SizedBox(width: Dimensions.width10,),
                  AppIcon(
                    icon: Icons.close,
                    iconColor: Colors.white,
                    size: Dimensions.height40,
                    iconSize: Dimensions.iconSize16,
                    radius: Dimensions.radius8,
                    backgroundColor:  Colors.white.withOpacity(0.1),
                  ),
                ],

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10
            ),
            child: CustomTextButton(
              height: Dimensions.height40,
              text: "Claim Now",
              color: Colors.white,
              textColor: Colors.black,
              radius: Dimensions.height8 / 2 ,
            ),
          )
        ],
      )
    );
  }
}
