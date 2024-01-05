import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

import 'small_text.dart';

class TimeTableWidget extends StatelessWidget {

  final List<String> centerOperation;

  const TimeTableWidget({super.key, required this.centerOperation});

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
                text: centerOperation.join(', '),
                color: AppColors.textColor,
                size: Dimensions.font11,
              ),
              SizedBox(height: Dimensions.height10/2,),
              SmallText(
                text: "9.30AM - 3.30PM",
                color: AppColors.textColor,
                size: Dimensions.font11,

              )
            ],
          )

        ],
      ),
    );
  }
}

class AgeWidget extends StatelessWidget {
  final String ageString;
  const AgeWidget( {super.key, required this.ageString});

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
                text: ageString,
                color: AppColors.textColor,
                size: Dimensions.font11,

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
                size: Dimensions.font11,

              ),

            ],
          )

        ],
      ),
    );
  }
}

