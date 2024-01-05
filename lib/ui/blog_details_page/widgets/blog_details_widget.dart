import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/models/vos/blog_detail_model.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/back_view_with_title.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/long_text.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';

Widget blogDetailsTextView(BlogDetails blogDetails){
  return LongText(
    text: blogDetails.articleDescription,
    textColor: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.font12,
    color: Colors.grey.withOpacity(0.2),
  );
}

Widget blogImageAndNameView(BlogDetails blogDetails){
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: Dimensions.height10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackViewWithTitle(text: "BACK to listing"),
        SizedBox(height: Dimensions.height20,),
        BigText(
          text: blogDetails.articleName,
          color: AppColors.blueColor,
          fontWeight: FontWeight.w600,
          size: Dimensions.font16,
        ),
        SizedBox(height: Dimensions.height20,),
        RoundedNetworkImage(
          url: "https://res.cloudinary.com/tech-myanmar/image/upload/v1690305936/centers/vxjwcntuwogfq9w3ojhv.png",
          radius: Dimensions.radius8 / 2,
          width: Dimensions.height200,
          fit: BoxFit.cover,
        ),

      ],
    ),
  );
}