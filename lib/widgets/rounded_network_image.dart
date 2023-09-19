import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';

class RoundedNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  double radius;
  BoxFit fit;

  RoundedNetworkImage({super.key,
    this.width = 100,
    this.height = 100,
    required this.url,
    this.radius = 0,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    if(radius == 0){
      radius = Dimensions.radius8;
    }
    return Container(
      width: width == 100 ? Dimensions.width100 : width,
      height: height == 100 ? Dimensions.width100 : height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: fit
        )
      ),
    );
  }
}
