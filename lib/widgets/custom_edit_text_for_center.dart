import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CustomEditTextForCenter extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  TextInputType inputType;
  Color color;
  double height;
  double size;

  CustomEditTextForCenter({
    required this.controller,
    required this.hint,
    this.height = 50,
    this.inputType = TextInputType.text,
    this.color = Colors.transparent,
    this.size = 14,
  });

  @override
  State<CustomEditTextForCenter> createState() => _CustomEditTextForCenterState();
}

class _CustomEditTextForCenterState extends State<CustomEditTextForCenter> {
  String _errorText = "";
  JoinCenterController controller = Get.find<JoinCenterController>();

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the provided text
    widget.controller.text = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.height == 50) {
      widget.height = Dimensions.height100 / 2;
    }

    if (widget.size == 14) {
      widget.size = Dimensions.font14;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(Dimensions.radius10 / 2),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: TextField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: Dimensions.font14,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: widget.inputType,
              controller: widget.controller,
              onChanged: (newValue) => widget.controller.text = newValue,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: AppColors.textColor.withOpacity(0.4),
                ),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                setState(() {
                  // Clear any previous error message
                  _errorText = "";
                  // Perform validation based on inputType
                  if (controller.isTextEmpty(value)) {
                    _errorText = "* Please enter ${widget.hint}";
                    controller.updateErrorValue(false);

                  } else if (widget.inputType == TextInputType.number &&
                      !controller.isValidNumber(value)) {
                    _errorText = '* Please enter a valid number';
                    controller.updateErrorValue(false);

                  } else if (widget.inputType == TextInputType.emailAddress &&
                      !controller.isValidEmail(value)) {
                    controller.updateErrorValue(false);
                    _errorText = '* Please enter a valid email address';
                  } else {
                    // widget.controller.text = value; // No need to set text again
                    print(widget.controller.text);
                    controller.updateErrorValue(true);

                  }

                });
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: controller.hasError  ? Dimensions.height10 : 0,
              bottom: Dimensions.height10 / 2
          ),
          child: BigText(
            text: controller.hasError ? "* Please enter ${widget.hint.toLowerCase()}" : "",
            color: Colors.red,
            maxLines: 2,
            size: Dimensions.font12,
          ),
        ),
      ],
    );
  }


}
