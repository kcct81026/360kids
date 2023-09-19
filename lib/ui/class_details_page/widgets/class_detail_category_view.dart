import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_chip_list.dart';

class ClassDetailCategoryView extends StatelessWidget {
  const ClassDetailCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassDetailController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.height10,
          ),
          child: CustomChipList(controller.cateogryList),
        );
      },
    );
  }
}
