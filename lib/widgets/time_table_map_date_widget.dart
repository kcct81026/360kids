import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

import 'small_text.dart';

class TimeTableWidget extends StatelessWidget {
  const TimeTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: Dimensions.iconSize16,
          ),
          SizedBox(width: Dimensions.width5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Mon to Firday",
                color: AppColors.textColor,
                size: Dimensions.font12,
              ),
              SizedBox(height: Dimensions.height10/2,),
              SmallText(
                text: "9.30AM - 3.30PM",
                color: AppColors.textColor,
                size: Dimensions.font12,

              )
            ],
          )

        ],
      ),
    );
  }
}

class AgeWidget extends StatelessWidget {
  const AgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.grey,
            size: Dimensions.iconSize16,
          ),
          SizedBox(width: Dimensions.width5),
          Column(
            children: [
              SmallText(
                text: "3 to 5 years",
                color: AppColors.textColor,
                size: Dimensions.font12,

              ),

            ],
          )

        ],
      ),
    );
  }
}

class DistanceWidget extends StatelessWidget {
  const DistanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.grey,
            size: Dimensions.iconSize16,
          ),
          SizedBox(width: Dimensions.width5),
          Column(
            children: [
              SmallText(
                text: "8 km away",
                color: AppColors.textColor,
                size: Dimensions.font12,

              ),

            ],
          )

        ],
      ),
    );
  }
}

