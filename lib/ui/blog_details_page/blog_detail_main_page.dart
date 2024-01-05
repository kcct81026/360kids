import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/article_detail_controller.dart';
import 'package:three_sixty_kids/ui/blog_details_page/blog_detail_page.dart';
import 'package:three_sixty_kids/ui/center_details_page/center_detail_page.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/ui/home_page/home_page.dart';
import 'package:three_sixty_kids/utils/colors.dart';

class BlogDetailMainPage extends StatefulWidget {
  final int index;
  const BlogDetailMainPage({super.key,
    required this.index
  });

  @override
  State<BlogDetailMainPage> createState() => _BlogDetailMainPageState();
}

class _BlogDetailMainPageState extends State<BlogDetailMainPage> {


  @override
  void initState() {
    super.initState();
    //_loadResources();

  }

  @override
  Widget build(BuildContext context) {
    Get.find<ArticleDetailController>().getBlogDetail(widget.index);
    return SafeArea(
      child: GetBuilder<ArticleDetailController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: controller.isLoading ? AppColors.backgroundColor: Colors.white,
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),)
                  : BlogDetailPage(blogDetails: controller.articleDetail,),

            );
          }),
    );
  }
}
