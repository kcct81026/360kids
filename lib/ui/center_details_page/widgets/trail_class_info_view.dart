import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/dialog_controller.dart';
import 'package:three_sixty_kids/data/helper/string_format_helper.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/helper/route_helper.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class TrialClassInfoView extends StatelessWidget {
  final ClassItem classItem;
  const TrialClassInfoView({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  (Dimensions.height120 * 2 ) + Dimensions.height40,
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      padding: EdgeInsets.all( Dimensions.width10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius8),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Dimensions.width10/2,
              horizontal: Dimensions.height10/2,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                /*border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,

              ),*/
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // Shadow color
                    spreadRadius: 8, // Spread radius
                    //blurRadius: 8, // Blur radius
                    offset: Offset(0, 0),
                  )
                ]

            ),
            child: RoundedNetworkImage(
              url:  "https://res.cloudinary.com/tech-myanmar/image/upload/v1692338611/articles/sw0cvtnwnrbkcthwbjkp.jpg",
              height: Dimensions.height120,
              width: double.maxFinite,
            ),
          ),
          SizedBox(height: Dimensions.height10,),

          BigText(
            text: classItem.className,
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
          BigText(
            text: classItem.classDescription,
            maxLines: 3,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            size: Dimensions.font12,
          ),
          BigText(
            text: getFormattedAgeRange(classItem.classAgeRange),
            maxLines: 1,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            size: Dimensions.font12,
          ),
          GestureDetector(
            onTap: (){
              Get.find<ClassDetailController>();
              Get.find<DialogController>();
              Get.toNamed(RouteHelper.getClassDetailsPage(81026));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UnderlineText(
                  text: bookTrail,
                  fontWeight: FontWeight.w400,
                  size: Dimensions.font12,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                AppIcon(
                  icon: Icons.arrow_forward,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: Dimensions.iconSize16,
                  iconSize: Dimensions.height10,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
