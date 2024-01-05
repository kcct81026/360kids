import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_icon_button.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';

class JoinCenterCategoryListView extends StatelessWidget {
  const JoinCenterCategoryListView({Key? key}) : super(key: key);

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
                text: "Center Categories",
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
                size: Dimensions.font18,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),

              controller.isCategorySelected ?
                Container() :  Column(
                children: [
                  CustomTextIconButton(
                    text: "Please select some categories for center",
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
                        index < controller.categoryList.length;
                        index++)
                      GestureDetector(
                        onTap: (){
                          controller.updateCategoryCheckbox(controller.categoryList[index].id, !controller.categoryList[index].isSelected );
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.mainColor,
                              value: controller.categoryList[index].isSelected,
                              onChanged: (value) {
                                controller.updateCategoryCheckbox(controller.categoryList[index].id, !controller.categoryList[index].isSelected );

                              },
                            ),
                            SizedBox(width: Dimensions.width10/2), // Add the desired spacing
                            Expanded(
                              child: BigText(
                                size: Dimensions.font12,
                                text: controller.categoryList[index].label,
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
