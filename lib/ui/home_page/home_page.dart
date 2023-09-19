import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/article_info_widget.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/home_widgets.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/options_view.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/search_center_result_view.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';
import 'package:get/get.dart';

import 'widgets/article_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: JoinAppBar(),
        body: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            builder: (controller){
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeTitleWidget(),
                        OptionsView(),
                        joinAsCenterHomeWidget(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.centerList.isEmpty ? Container()
                            : SearchCenterResultView(controller: controller),
                        ArticleView(controller: controller,),
                      ],
                    ),
                  ),


                ],
              );
            },
          ),
        ),
      ),
    );
  }
}