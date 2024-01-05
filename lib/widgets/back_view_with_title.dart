import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';


class BackViewWithTitle extends StatelessWidget {

  final String text;

  const BackViewWithTitle({super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back,
            color: AppColors.blueColor,
            size: Dimensions.iconSize24,
          ),
          SizedBox(width: Dimensions.width10,),
          BigText(
            text: text,
            color: AppColors.blueColor,
            size: Dimensions.font12,
          )
        ],
      ),
    );
  }
}
