import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/center_info_widget.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class SearchCenterResultView extends StatelessWidget {
  final HomeController controller;
  const SearchCenterResultView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(
        top: Dimensions.height40,
        bottom: Dimensions.height10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "${controller.centerList.length} center results",
                fontWeight: FontWeight.bold,
                size: Dimensions.font16,
              ),
              Container(
                height: Dimensions.height20 * 2,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius8 / 2),
                ),
                child: GestureDetector(
                  onTap: () {
                    controller.clearSearch();
                  },
                  child: Center(
                      child: Row(
                    children: [
                      BigText(
                        text: "Clear Search",
                        color: AppColors.mainColor,
                        size: Dimensions.font11,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      AppIcon(
                        icon: Icons.clear,
                        size: Dimensions.iconSize16,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10,

                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            height: (Dimensions.height150) * controller.centerList.length, // Adjust the height as needed
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.centerList.length,
              itemBuilder: (context, index) {
                // Replace this with your custom widget for each item
                return CenterInfoView(centerItem: controller.centerList[index],);
              },
            ),
          )
        ],
      ),
    );
  }
}
