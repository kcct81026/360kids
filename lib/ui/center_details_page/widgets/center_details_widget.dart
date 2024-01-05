import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/helper/string_format_helper.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/back_view_with_title.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/long_text.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';
import 'package:three_sixty_kids/widgets/time_table_map_date_widget.dart';

Widget centerDetailsTextView(CenterDetail centerDetail){
  return LongText(
    text: centerDetail.centerDescription,
    textColor: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.font12,
    color: Colors.grey.withOpacity(0.2),
  );
}

Widget infoTimeTableAndDateWidget(CenterDetail centerDetail){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TimeTableWidget(centerOperation: centerDetail.centerOperation,),
      SizedBox(height: Dimensions.height15,),
      AgeWidget(ageString: getFormattedAgeRange(centerDetail.centerAgeRange),),
      SizedBox(height: Dimensions.height15,),
      DistanceWidget(),
    ],
  );
}



Widget centerImageAndNameView(CenterDetail centerDetail){
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: Dimensions.height10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackViewWithTitle(text: "BACK to listing"),
        SizedBox(height: Dimensions.height20,),
        RoundedNetworkImage(
          url: "https://res.cloudinary.com/tech-myanmar/image/upload/v1690305936/centers/vxjwcntuwogfq9w3ojhv.png",
          radius: Dimensions.radius8 / 2,
          width: Dimensions.height150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: Dimensions.height20,),
        BigText(
          text: centerDetail.centerName,
          color: AppColors.blueColor,
          fontWeight: FontWeight.w600,
          size: Dimensions.font16,
        ),

      ],
    ),
  );
}

/*

class TimeTableAgeDistanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Prepare your list of widgets
    List<Widget> widgetList = [
      _timeTableWidget(),
      _ageWidget(),
      _distanceWiget(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Calculate the maximum number of widgets that can fit in a row
            int maxWidgetsPerRow = 1; //(constraints.maxWidth / 3).floor();

            return Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < widgetList.length; i += maxWidgetsPerRow)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widgetList
                        .skip(i)
                        .take(maxWidgetsPerRow)
                        .toList(),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

}

 */