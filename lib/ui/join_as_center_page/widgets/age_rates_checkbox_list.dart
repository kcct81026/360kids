import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_icon_button.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';

class AgeRatesView extends StatelessWidget {
  const AgeRatesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinCenterController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.width10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Age rates",
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
                size: Dimensions.font18,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),

              controller.isAgeSelected ?
                Container() :  Column(
                children: [
                  CustomTextIconButton(
                    text: "Please select age rates for your center",
                    fontSize: Dimensions.font11,

                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int index = 0;
                        index < controller.ageList.length;
                        index++)
                      GestureDetector(
                        onTap: (){
                          controller.updateAgeCheckbox(controller.ageList[index].id, !controller.ageList[index].isSelected );
                          print(controller.ageList[index].isSelected);
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.mainColor,
                              value: controller.ageList[index].isSelected,
                              onChanged: (value) {
                                controller.updateAgeCheckbox(controller.ageList[index].id, !controller.ageList[index].isSelected );

                              },
                            ),
                            SizedBox(width: Dimensions.width10/2), // Add the desired spacing
                            Expanded(
                              child: BigText(
                                size: Dimensions.font12,
                                text: controller.ageList[index].label,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
            ],
          ),
        );
      },
    );
  }
}
