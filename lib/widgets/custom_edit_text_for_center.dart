import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';

class CustomEditTextForCenter extends StatefulWidget {
  final TextEditingController editingController;
  final String hint;
  TextInputType inputType;
  Color color;
  double height;
  double size;

  CustomEditTextForCenter({
    required this.editingController,
    required this.hint,
    this.height = 40,
    this.inputType = TextInputType.text,
    this.color = Colors.transparent,
    this.size = 14,
  });

  @override
  State<CustomEditTextForCenter> createState() => _CustomEditTextForCenterState();
}

class _CustomEditTextForCenterState extends State<CustomEditTextForCenter> {
  String _errorText = "";

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the provided text
    widget.editingController.text = widget.editingController.text;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.height == 40) {
      widget.height = Dimensions.height40;
    }

    if (widget.size == 14) {
      widget.size = Dimensions.font12;
    }

    return GetBuilder<JoinCenterController>(
      builder: (controller){
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
                  controller: widget.editingController,
                  onChanged: (newValue) => widget.editingController.text = newValue,
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

                      if (controller.isTextEmpty(value)) {
                        _errorText = "* Please enter ${widget.hint.toLowerCase()}";

                      } else if (widget.inputType == TextInputType.number &&
                          !controller.isValidNumber(value)) {
                        _errorText = '* Please enter a valid number';

                      } else if (widget.inputType == TextInputType.emailAddress &&
                          !controller.isValidEmail(value)) {
                        _errorText = '* Please enter a valid email address';
                      }


                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.height10/2,
                left:Dimensions.height10/2 ,
                bottom: Dimensions.height10,
              ),
              child: BigText(
                text: (!controller.hasError && (widget.editingController.text).isEmpty)
                    ? _errorText :
                ((controller.getErrorText(widget.editingController.text, widget.inputType,widget.hint).isEmpty)
                    ? _errorText//controller.getErrorText(widget.editingController.text, widget.inputType)
                    : controller.getErrorText(widget.editingController.text, widget.inputType,widget.hint)
                ),
                color: Colors.red,
                maxLines: 2,
                size: Dimensions.font11,
              ),
            ),


          ],
        );
      },
    );


  }

}
