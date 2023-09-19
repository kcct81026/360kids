import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/ui/home_page/home_page.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/center_loader.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
          builder: (controller) {
            return Scaffold(
                backgroundColor: controller.isLoading ? Colors.black :  AppColors.backgroundColor,
                body: controller.isLoading ? CustomLoader() : const HomePage(),

            );
          }),
    );
  }
}
