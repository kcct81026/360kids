import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/ui/center_details_page/widgets/center_deatail_category_view.dart';
import 'package:three_sixty_kids/ui/class_details_page/widgets/class_details_widgets.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';


class ClassDetailPage extends StatelessWidget {
  const ClassDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    CenterDetailController controller = Get.find<CenterDetailController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: JoinAppBar(),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          children: [
            ClassImageAndBackView(),
            infoTimeTableAndDateWidget(),
            CenterDetailCategoryView(),
            centerDetailsTextView(),
            SizedBox(height:  Dimensions.height20  *  3,)

          ],
        ),
        floatingActionButton: Container(
          height: Dimensions.height150 / 3,
          width: Dimensions.screenWidth - 30,
          //padding: EdgeInsets.all(Dimensions.width10),
          color: Colors.transparent,
          child: CustomTextButton(
            text: inquiry_class,
          ),
        ),


      ),
    );
  }
}
