import 'package:flutter/material.dart';
import 'package:three_sixty_kids/ui/center_details_page/center_detail_page.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/ui/home_page/home_page.dart';
import 'package:three_sixty_kids/utils/colors.dart';

class CenterDetailMainPage extends StatefulWidget {
  final int index;
  const CenterDetailMainPage({super.key,
    required this.index
  });

  @override
  State<CenterDetailMainPage> createState() => _CenterDetailMainPageState();
}

class _CenterDetailMainPageState extends State<CenterDetailMainPage> {


  @override
  void initState() {
    super.initState();
    //_loadResources();

  }

  @override
  Widget build(BuildContext context) {
    Get.find<CenterDetailController>().getCenterDetail(widget.index);
    return SafeArea(
      child: GetBuilder<CenterDetailController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: controller.isLoading ? AppColors.backgroundColor: Colors.white,
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),)
                  : CenterDetailPage(centerDetail: controller.centerDetail,),

            );
          }),
    );
  }
}
