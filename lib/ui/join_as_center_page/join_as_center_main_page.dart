import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/ui/home_page/home_page.dart';
import 'package:three_sixty_kids/ui/join_as_center_page/join_as_center_page.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/center_loader.dart';

class JoinAsCenterMainPage extends StatefulWidget {
  const JoinAsCenterMainPage({super.key,
  });

  @override
  State<JoinAsCenterMainPage> createState() => _JoinAsCenterMainPageState();
}

class _JoinAsCenterMainPageState extends State<JoinAsCenterMainPage> {


  @override
  void initState() {
    super.initState();
    //_loadResources();

  }

  @override
  Widget build(BuildContext context) {
    Get.find<JoinCenterController>().fetchAgeRatesCheckboxesFromServer();
    return SafeArea(
      child: GetBuilder<JoinCenterController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: controller.isLoading ? AppColors.backgroundColor: Colors.white,
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),)
                  : const JoinAsCenterPage(),

            );
          }),
    );
  }
}