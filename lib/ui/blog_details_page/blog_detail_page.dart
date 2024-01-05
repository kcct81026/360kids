import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/article_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/models/vos/blog_detail_model.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/ui/blog_details_page/widgets/blog_details_widget.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';


class BlogDetailPage extends StatelessWidget {
  final BlogDetails blogDetails;
  const BlogDetailPage({super.key, required this.blogDetails});

  @override
  Widget build(BuildContext context) {
    ArticleDetailController controller = Get.find<ArticleDetailController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: JoinAppBar(),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          children: [
            Container(
              margin: EdgeInsets.all(Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blogImageAndNameView(blogDetails),

                  blogDetailsTextView(blogDetails),

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