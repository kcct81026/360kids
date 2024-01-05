import 'package:flutter/material.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/valid_checker.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CustomEditText extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  TextInputType inputType;
  Color color;
  double height;
  double size;

  CustomEditText({
    required this.controller,
    required this.hint,
    this.height = 40,
    this.inputType = TextInputType.text,
    this.color = Colors.transparent,
    this.size = 14,
  });

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  String _errorText = "";

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the provided text
    widget.controller.text = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.height == 40) {
      widget.height = Dimensions.height40;
    }

    if (widget.size == 14) {
      widget.size = Dimensions.font12;
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
                fontSize: Dimensions.font12,
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
                  if (value.isEmpty) {
                    _errorText = "* Please enter ${widget.hint}";
                  } else if (widget.inputType == TextInputType.number &&
                      !ValidChecker.isValidNumber(value)) {
                    _errorText = '* Please enter a valid number';
                  } else if (widget.inputType == TextInputType.emailAddress &&
                      !ValidChecker.isValidEmail(value)) {
                    _errorText = '* Please enter a valid email address';
                  } else {
                    print(value);
                    // widget.controller.text = value; // No need to set text again
                    print(widget.controller.text);
                  }
                });
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: !_errorText.isEmpty ? Dimensions.height10 : 0,
            bottom: Dimensions.height10 / 2
          ),
          child: BigText(
            text: _errorText.toLowerCase(),
            color: Colors.red,
            maxLines: 2,
            size: Dimensions.font11,
          ),
        ),
      ],
    );
  }


}
