import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final FontWeight? fontWeight;

  const SmallText({Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.fontWeight = FontWeight.normal,
    this.size = 0,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: size == 0? Dimensions.font12 : size,
        fontWeight: fontWeight
      ),
    );
  }
}
