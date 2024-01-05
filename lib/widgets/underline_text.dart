import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';

class UnderlineText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;
  final FontWeight fontWeight;

  const UnderlineText({Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w400,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: color,
        fontFamily: "Poppins",
        color: color,
        fontSize: size == 0? Dimensions.font11 : size,
        fontWeight: fontWeight
      ),
    );
  }
}
