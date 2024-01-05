import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/models/responses/blog_response.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/app_icon.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class ArticleInfoWidget extends StatelessWidget {
  final Article article;
  const ArticleInfoWidget( {super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height:  (Dimensions.height120 * 2 ) + Dimensions.height10,
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
              url: "https://media.istockphoto.com/id/949118068/photo/books.jpg?s=612x612&w=0&k=20&c=1vbRHaA_aOl9tLIy6P2UANqQ27KQ_gSF-BH0sUjQ730=",
              height: Dimensions.height120,
              width: double.maxFinite,
            ),
          ),
          SizedBox(height: Dimensions.height10 / 2,),
          IntrinsicWidth(
            child:  CustomTextButton(
              height: Dimensions.height40,
              text: article.articleCategory,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: Dimensions.height10 / 2,),

          BigText(
            text: article.articleName,
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: Dimensions.height10 / 2,),

          BigText(
            text: article.articleDescription,
            maxLines: 3,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            size: Dimensions.font12,
          ),
          SizedBox(height: Dimensions.height10 / 2,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: article.dateTime,
                color: Colors.grey,
                size: Dimensions.font11,
              ),
              BigText(
                text: "5 mins read",
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                size: Dimensions.font11,

              ),
            ],
          ),
        ],
      ),
    );
  }
}
