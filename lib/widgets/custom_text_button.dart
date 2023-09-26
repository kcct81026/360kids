import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  Color? color;
  double padding;
  Color? textColor;
  FontWeight fontWeight;
  double height;
  double fontSize;
  double radius;
  Color borderColor;


  CustomTextButton({super.key,
    required this.text,
    this.color = const Color(0xFFFE9800),
    this.textColor = const Color(0xFFFFFFFF),
    this.padding = 10,
    this.fontWeight = FontWeight.w400,
    this.height = 50,
    this.fontSize = 0,
    this.radius = 0,
    this.borderColor = Colors.transparent,
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
        border: Border.all(
          color: borderColor,
          width: 1,// Add your desired border color here
          //width: borderWidth, // Specify the border width if needed
        ),
      ),

      child: Center(
        child: BigText(
          text: text,
          color: textColor,
          fontWeight: fontWeight,
          size: fontSize == 0? Dimensions.font16 : fontSize,
        ),
      ),
    );
  }
}
