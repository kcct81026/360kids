import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/data/helper/string_format_helper.dart';
import 'package:three_sixty_kids/data/models/vos/class_detail_model.dart';
import 'package:three_sixty_kids/ui/class_details_page/widgets/image_with_indicator.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/back_view_with_title.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/long_text.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/time_table_map_date_widget.dart';

Widget infoTimeTableAndDateWidget(ClassDetails classDetails){
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: Dimensions.width10
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeTableWidget(centerOperation: classDetails.classOperation,),
        SizedBox(height: Dimensions.height15,),
        AgeWidget(ageString: getFormattedAgeRange(classDetails.classAgeRange),),
        SizedBox(height: Dimensions.height15,),
        DistanceWidget(),
        SizedBox(height: Dimensions.height10,),

      ],
    ),
  );
}

Widget centerDetailsTextView(ClassDetails classDetails){
  return Container(
    margin: EdgeInsets.all(
      Dimensions.width10
    ),
    child: LongText(
      text: classDetails.classDescription,
      textColor: AppColors.textColor,
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.font12,
      color: Colors.grey.withOpacity(0.2),
    ),
  );
}

class ClassImageAndBackView extends StatelessWidget {
  final ClassDetails classDetail;
  const ClassImageAndBackView({super.key, required this.classDetail});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassDetailController>(
      builder: (controller){
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width10,
              vertical: Dimensions.height20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackViewWithTitle(text: "BACK / Center / Class details"),
              SizedBox(height: Dimensions.height15,),
              ImageWithIndicator(
                imgList: [controller.classDetails.classImage],
              ),
            /*  ImageWithIndicator(
                  imgList: controller.cateogryList){

              },*/
              SizedBox(height: Dimensions.height15,),
              Center(
                child: BigText(
                  text: "Thank you for your interest!",
                  color: AppColors.textColor,
                  size: Dimensions.font12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              Container(
                height: Dimensions.height10 / 10,
                color: Colors.grey,
              ),
              SizedBox(height: Dimensions.height20,),
              BigText(
                text: classDetail.className,
                color: AppColors.blueColor,
                fontWeight: FontWeight.w600,
                size: Dimensions.font16,
              ),
              SizedBox(height: Dimensions.height10,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Center - ',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: Dimensions.font12, // Font size for the first part
                        fontWeight: FontWeight.w600, // You can apply other styles too
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: classDetail.centerName, // Second part of the text
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: Dimensions.font12, // Font size for the second part
                        fontWeight: FontWeight.w600, // You can apply other styles too
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Dimensions.height10,),

            ],
          ),
        );
      },
    );
  }
}
