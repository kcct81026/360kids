import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/ui/center_details_page/widgets/center_deatail_category_view.dart';
import 'package:three_sixty_kids/ui/center_details_page/widgets/trail_class_info_view.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/article_info_widget.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CenterTrailClassView extends StatelessWidget {
  final CenterDetailController controller;
  const CenterTrailClassView({super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Dimensions.height15,
            ),
            child: BigText(
              text: trailClasses,
              color: AppColors.blueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          for(int i = 0; i < controller.centerDetail.classList.length; i++)
            TrialClassInfoView(classItem: controller.centerDetail.classList[i])

        ],
      ),
    );
  }
}

