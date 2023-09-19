import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/helper/route_helper.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class CenterInfoView extends StatelessWidget {
  const CenterInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.find<CenterDetailController>();
        Get.toNamed(RouteHelper.getCenterDetailsPage(81026));
      },
      child: Container(
        height: Dimensions.height20 + Dimensions.height100,
        margin: EdgeInsets.only(bottom: Dimensions.height10),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedNetworkImage(
              url: "https://res.cloudinary.com/tech-myanmar/image/upload/v1694005934/articles/ng1j12x1tyzqtmuzavgs.jpg",
              width: Dimensions.height100,
              height: Dimensions.height100,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                    text: "Global Art",
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  BigText(
                    text:
                        "As human beings, the ability to learn and grow is encoded in our DNA. Our DNA provides the potential, but it is our experiences that release that potential, shape it, focus it and, hopefully, turn it into what the world recognises as success.",
                    maxLines: 2,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    size: Dimensions.font14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UnderlineText(
                        text: exploreMore,
                        fontWeight: FontWeight.w400,
                        size: Dimensions.font14,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
