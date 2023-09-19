import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';

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
                TitleJoinCenter(controller: controller),
                TextFieldJoinCenterList(),

              ],

            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: Dimensions.height150 / 3,
        width: Dimensions.screenWidth - 30,
        //padding: EdgeInsets.all(Dimensions.width10),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: (){
            if(controller.hasError){
              print("error------------");
            }
            else{
              print("no error --------------");
            }
          },
          child: CustomTextButton(
            text: "Submit",
          ),
        ),
      ),
    );
  }
}

