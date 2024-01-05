import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class TitleJoinCenter extends StatelessWidget {
  const TitleJoinCenter({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinCenterController>(
      builder: (controller){
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (controller.hasError)
                  ? Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.height15,
                ),
                child: BigText(
                  text: "We are launching soon!",
                ),
              ) : Container(),
              BigText(
                text: signup_bit,
                fontWeight: FontWeight.w500,
                maxLines: 3,
              ),
              SizedBox(height: Dimensions.height15,),
              BigText(
                text: "Join with us to get more leads",
                color: Colors.grey,
                maxLines: 3,
              ),
              SizedBox(height: Dimensions.height15,),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: "How It Works",
                    color: AppColors.blueColor,
                    size: Dimensions.font12,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: Dimensions.width10,),
                  Icon(
                    Icons.arrow_forward,
                    size: Dimensions.iconSize16,
                    color: AppColors.blueColor,
                  )
                ],
              )

            ],
          ),
        );
      },
    );
  }
}
