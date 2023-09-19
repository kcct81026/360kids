import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/ui/center_details_page/center_detail_page.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/ui/class_details_page/class_detail_page.dart';
import 'package:three_sixty_kids/ui/home_page/home_page.dart';
import 'package:three_sixty_kids/utils/colors.dart';

class ClassDetailMainPage extends StatefulWidget {
  final int index;
  const ClassDetailMainPage({super.key,
    required this.index
  });

  @override
  State<ClassDetailMainPage> createState() => _ClassDetailMainPageState();
}

class _ClassDetailMainPageState extends State<ClassDetailMainPage> {


  @override
  void initState() {
    super.initState();
    //_loadResources();

  }

  @override
  Widget build(BuildContext context) {
    Get.find<ClassDetailController>().fetchOptions(widget.index);
    return SafeArea(
      child: GetBuilder<ClassDetailController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: controller.isLoading ? AppColors.backgroundColor: Colors.white,
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),)
                  : const ClassDetailPage(),

            );
          }),
    );
  }
}
