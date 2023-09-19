import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final int maxLines;

  const BigText({Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines == 1 ? 1 : maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: size == 0? Dimensions.font16 : size,
        fontWeight: fontWeight
      ),
    );
  }
}
