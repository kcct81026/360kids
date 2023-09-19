import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/ui/home_page/widgets/article_info_widget.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';
import 'package:three_sixty_kids/widgets/underline_text.dart';

class ArticleView extends StatelessWidget {
  final HomeController controller;
  const ArticleView({super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: EdgeInsets.only(
        top: Dimensions.height20,
        bottom: Dimensions.height20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: artitleTitle,
                fontWeight: FontWeight.bold,
                size: Dimensions.font16,
              ),
              SizedBox(width: Dimensions.width10,),
              UnderlineText(
                text: "Articles",
                fontWeight: FontWeight.bold,
                size: Dimensions.font16,
                color: AppColors.mainColor,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          SmallText(
            text: "We believe in the power of knowledge and strive to provide you with valuable insights on a wide range of topics.",
            fontWeight: FontWeight.w400,
            size: Dimensions.font14,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          IntrinsicWidth(
            child: CustomTextButton(
              text: "Read More Blogs",
              fontWeight: FontWeight.normal,
              fontSize: Dimensions.font12,
            ),
          ),
          SizedBox(height: Dimensions.height30,),
          Container(
            height: ((Dimensions.height200 * 2)+Dimensions.height20) * controller.options.length, // Adjust the height as needed
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.options.length,
              itemBuilder: (context, index) {
                // Replace this with your custom widget for each item
                return ArticleInfoWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
