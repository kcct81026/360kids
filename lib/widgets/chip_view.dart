import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/small_text.dart';

class ChipView extends StatelessWidget {
  final String text;

  const ChipView(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
          backgroundColor: AppColors.textColor,
          label: SmallText(
            text: text,
            color: Colors.white,
          )
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
      ],
    );
  }
}