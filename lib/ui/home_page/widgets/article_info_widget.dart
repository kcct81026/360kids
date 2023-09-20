import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class ArticleInfoWidget extends StatelessWidget {
  const ArticleInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  (Dimensions.height200 * 2 ) + Dimensions.height10,
      margin: EdgeInsets.only(bottom: Dimensions.height10),
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
              vertical: Dimensions.width10,
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
              height: Dimensions.height200,
              width: double.maxFinite,
            ),
          ),
          IntrinsicWidth(
            child:  CustomTextButton(
              height: Dimensions.height40,
              text: "Healthy",
              color: Colors.grey,
            ),
          ),
          BigText(
            text: "Article Title",
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
          BigText(
            text:
            "As human beings, the ability to learn and grow is encoded in our DNA. Our DNA provides the potential, but it is our experiences that release that potential, shape it, focus it and, hopefully, turn it into what the world recognises as success.",
            maxLines: 3,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            size: Dimensions.font14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "August 18 2023",
                color: Colors.grey,
                size: Dimensions.font12,
              ),
              BigText(
                text: "5 mins read",
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                size: Dimensions.font12,

              ),
            ],
          ),
        ],
      ),
    );
  }
}
