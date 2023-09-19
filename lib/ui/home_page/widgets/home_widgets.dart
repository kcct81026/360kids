import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';

Widget joinAsCenterHomeWidget() {
  return Container(
    margin: EdgeInsets.only(
      top: Dimensions.height20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'OR ',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: Dimensions.font24, // Font size for the first part
                    fontWeight: FontWeight.bold, // You can apply other styles too
                    color: AppColors.textColor,
                  ),
                ),
                TextSpan(
                  text: ' Join As A Center ->', // Second part of the text
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: Dimensions.font16, // Font size for the second part
                    fontWeight: FontWeight.w400, // You can apply other styles too
                    color: AppColors.blueColor,
                  ),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: Dimensions.height10,),
        Container(
          height: Dimensions.height150,
          child: Image.asset(
            'assets/images/book.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
    )

  );
}

Widget homeTitleWidget() {
  return Container(
    margin: EdgeInsets.only(
      top: Dimensions.height20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Find ',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: Dimensions.font24, // Font size for the first part
                  fontWeight: FontWeight.bold, // You can apply other styles too
                  color: AppColors.textColor,
                ),
              ),
              TextSpan(
                text: ' perfect enrichment', // Second part of the text
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: Dimensions.font16, // Font size for the second part
                  fontWeight: FontWeight.w400, // You can apply other styles too
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'centers ',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.textColor,
                  fontFamily: "Poppins",
                  fontSize: Dimensions.font16, // Font size for the first part
                  fontWeight: FontWeight.bold, // You can apply other styles too
                  color: AppColors.textColor,
                ),
              ),
              TextSpan(
                text: ' for your kids', // Second part of the text
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: Dimensions.font16, // Font size for the second part
                  fontWeight: FontWeight.w400, // You can apply other styles too
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SmallText(
          text: searchByPostal,
          color: Colors.grey,
          size: Dimensions.font14,
          //fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
