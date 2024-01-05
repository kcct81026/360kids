import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';

class LongText extends StatelessWidget {
  final String text;
  Color? color;
  double padding;
  Color? textColor;
  FontWeight fontWeight;
  double fontSize;
  double radius;

  LongText({super.key,
    required this.text,
    this.color = const Color(0xFFFE9800),
    this.textColor = const Color(0xFFFFFFFF),
    this.padding = 10,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 0,
    this.radius = 0
  });

  @override
  Widget build(BuildContext context) {
    if(radius == 0){
      radius = Dimensions.radius8 ;
    }
    return Container(
      padding: EdgeInsets.all(
          padding == 10 ? Dimensions.width10 : padding
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: SmallText(
          text: text,
          color: textColor,
          fontWeight: fontWeight,
          size: fontSize == 0? Dimensions.font12 : fontSize,
        ),
      ),
    );
  }
}
