import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/back_view_with_title.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/long_text.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';
import 'package:three_sixty_kids/widgets/time_table_map_date_widget.dart';

Widget centerDetailsTextView(){
  return LongText(
    text: "Are you a parent looking for effective ways to introduce your child to the world of financial management?\nAs parents, we have a unique opportunity to shape our children's financial habits and attitudes from an early age. By introducing financial literacy at a young age, we can help our children develop essential money management skills, make informed decisions, and cultivate healthy financial habits that will serve them well throughout their lives.\nWe understand that learning about finances can be challenging for children, so we've created a collection of engaging and fun activities that will capture their interest and make learning enjoyable. For example, you can encourage your child to create a savings goal chart, where they can track their progress towards a desired toy or experience. This allows them to understand the importance of saving and delayed gratification.\nWe know that parenting isn't always easy, especially when it comes to teaching complex topics like financial literacy. That's why we have compiled a series of practical and easy-to-implement parenting tips that will help you navigate this journey with confidence.\nStart with Basic Money Concepts: Introduce your child to the concept of money by using real coins and bills. Play 'store' with them, asking them to count and exchange money for items they want to 'purchase'. This will help them understand the value of money and the importance of making choices.\nTeach the Difference Between Needs and Wants: Engage your child in discussions about differentiating between needs and wants. For example, when grocery shopping, explain that buying healthy food is a need, while buying cookies is a want. This will help them prioritize their spending and make wise choices.\nEstablish a Savings Routine: Set up a regular savings routine with your child. Encourage them to save a portion of their allowance, gift money, or earnings from chores in a piggy bank or savings account. This will instill the habit of saving from an early age and help them understand the value of delayed gratification.\nInvolve Your Child in Everyday Financial Decisions: When making financial decisions, like comparing prices or budgeting for family activities, involve your child in the process. Explain why you choose a certain option over another based on factors like quality, value, and affordability. This will help them develop critical thinking skills and understand the importance of making informed choices.\nBe a Role Model: Children learn by observing their parents, so it's essential to lead by example. Demonstrate responsible financial behavior by budgeting, saving, and avoiding unnecessary debt. Show them that financial responsibility is a lifelong journey and that smart money habits lead to long-term financial security. It's never too early to start teaching your child about money management and financial literacy. By equipping them with these essential skills, you're giving them a gift that will last a lifetime.\n\nTogether, let's shape a bright and financially empowered future for our children.",
    textColor: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.font14,
    color: Colors.grey.withOpacity(0.2),
  );
}

Widget infoTimeTableAndDateWidget(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TimeTableWidget(),
      SizedBox(height: Dimensions.height15,),
      AgeWidget(),
      SizedBox(height: Dimensions.height15,),
      DistanceWidget(),
    ],
  );
}



Widget centerImageAndNameView(){
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: Dimensions.height10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackViewWithTitle(text: "BACK to listing"),
        SizedBox(height: Dimensions.height20,),
        RoundedNetworkImage(
          url: "https://res.cloudinary.com/tech-myanmar/image/upload/v1690305936/centers/vxjwcntuwogfq9w3ojhv.png",
          radius: Dimensions.radius8 / 2,
          width: Dimensions.height150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: Dimensions.height20,),
        BigText(
          text: "Center Name",
          color: AppColors.blueColor,
          fontWeight: FontWeight.w600,
          size: Dimensions.font18,
        ),

      ],
    ),
  );
}

/*

class TimeTableAgeDistanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Prepare your list of widgets
    List<Widget> widgetList = [
      _timeTableWidget(),
      _ageWidget(),
      _distanceWiget(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Calculate the maximum number of widgets that can fit in a row
            int maxWidgetsPerRow = 1; //(constraints.maxWidth / 3).floor();

            return Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < widgetList.length; i += maxWidgetsPerRow)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widgetList
                        .skip(i)
                        .take(maxWidgetsPerRow)
                        .toList(),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

}

 */