import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/ui/join_as_center_page/widgets/join_center_submit.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';

import 'widgets/age_rates_checkbox_list.dart';
import 'widgets/text_field_join_center_list.dart';
import 'widgets/title_join_center_widget.dart';

class JoinAsCenterPage extends StatelessWidget {
  const JoinAsCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinCenterController controller = Get.find<JoinCenterController>();
    return Scaffold(
      appBar: JoinAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: Dimensions.height20,
                horizontal: Dimensions.width10
            ),
            child: Column(
              children: [
                TitleJoinCenter(),
                TextFieldJoinCenterList(),

              ],

            ),
          ),
          AgeRatesView(),
          JoinCenterSubmitView(),


        ],
      ),

    );
  }
}

