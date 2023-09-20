import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CustomTextIconButton extends StatelessWidget {
  final String text;
  Color? color;
  double padding;
  Color? textColor;
  FontWeight fontWeight;
  double height;
  double fontSize;
  double radius;

  CustomTextIconButton({super.key,
    required this.text,
    this.color = const Color(0xFFFCE4E3),
    this.textColor = const Color(0xFFCC1B1B),
    this.padding = 10,
    this.fontWeight = FontWeight.w400,
    this.height = 50,
    this.fontSize = 0,
    this.radius = 0
  });

  @override
  Widget build(BuildContext context) {
    if(radius == 0){
      radius = Dimensions.radius8 ;
    }
    return Container(
      height: height == 50 ? (Dimensions.height100 / 2) : height,
      padding: EdgeInsets.symmetric(
          horizontal: padding == 10 ? Dimensions.width10 : padding
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: Dimensions.width10 / 2,),
            Icon(
              Icons.warning_amber,
              size: Dimensions.iconSize16,
              color: AppColors.redColor ,
            ),
            SizedBox(width: Dimensions.width10 / 2,),

            Expanded(
              child: BigText(
                text: text,
                color: textColor,
                fontWeight: fontWeight,
                maxLines: 1,
                size: fontSize == 0? Dimensions.font14 : fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
