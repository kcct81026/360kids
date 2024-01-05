import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_chip_list.dart';

class CenterDetailCategoryView extends StatelessWidget {
  final List<String> categories;
  const CenterDetailCategoryView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10,
          horizontal: Dimensions.height10
      ),
      child: CustomChipList(categories),
    );
  }
}
