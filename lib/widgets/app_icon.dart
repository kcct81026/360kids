import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';

class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize ;
  double radius;

  AppIcon({ Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.iconSize = 16,
      this.radius = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(radius == 0){
      radius = size / 2 ;
    }
    return Container(
      width: size,
      height: size == 40 ? Dimensions.height40 : size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius) ,
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 16 ? Dimensions.iconSize16 : iconSize,
      ),
    );
  }
}
