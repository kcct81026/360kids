import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';

import 'widgets/center_deatail_category_view.dart';
import 'widgets/center_details_widget.dart';
import 'widgets/center_trail_class_view.dart';
import 'widgets/message_for_center_view.dart';

class CenterDetailPage extends StatelessWidget {
  const CenterDetailPage({super.key});

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
            MessageForCenterView(),
            Container(
              margin: EdgeInsets.all(Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  centerImageAndNameView(),
                  infoTimeTableAndDateWidget(),
                  CenterDetailCategoryView(),
                  centerDetailsTextView(),
                  CenterTrailClassView(controller: controller,),

                ],
              ),

            ),


          ],
        ),

      ),
    );
  }
}

/*SliverToBoxAdapter(
              child: Column(
                children: [
                  MessageForCenterView(),
                  Container(
                    margin: EdgeInsets.all(Dimensions.width10),
                    child: Column(
                      children: [
                        centerImageAndNameView(),
                        infoTimeTableAndDateWidget(),
                        CenterDetailCategoryView(),
                      ],
                    ),
                  )
                ],
              ),
            ),
*/


/*body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MessageForCenterView(),
                  Container(
                    margin: EdgeInsets.all(Dimensions.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        centerImageAndNameView(),
                        infoTimeTableAndDateWidget(),
                        CenterDetailCategoryView(),

                      ],
                    ),
                  ),

                ]
              ),
            ),

          ],
        ),*/