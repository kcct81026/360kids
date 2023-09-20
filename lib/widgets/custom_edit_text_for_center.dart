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

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the provided text
    widget.editingController.text = widget.editingController.text;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.height == 50) {
      widget.height = Dimensions.height100 / 2;
    }

    if (widget.size == 14) {
      widget.size = Dimensions.font14;
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
                    fontSize: Dimensions.font14,
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

                      print("---------------------------------- error ${_errorText}");

                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: (!controller.hasError && (widget.editingController.text).isEmpty)
                    ?  Dimensions.height10 :
                ( (controller.getErrorText(widget.editingController.text, widget.inputType,widget.hint).isEmpty)
                    ? Dimensions.height10
                    : Dimensions.height10
                ),
                bottom: Dimensions.height10 / 2,
              ),
              child: BigText(
                text: (!controller.hasError && (widget.editingController.text).isEmpty)
                    ? _errorText :
                ((controller.getErrorText(widget.editingController.text, widget.inputType,widget.hint).isEmpty)
                    ? _errorText//controller.getErrorText(widget.editingController.text, widget.inputType)
                    : controller.getErrorText(widget.editingController.text, widget.inputType,widget.hint)
                ),
                /*text: (controller.hasError && controller.getErrorText(widget.editingController.text, widget.inputType).isEmpty)
                    ? "${controller.getErrorText(widget.editingController.text, widget.inputType)} ${widget.hint.toLowerCase()}"
                    : controller.getErrorText(widget.editingController.text, widget.inputType),*/
                color: Colors.red,
                maxLines: 2,
                size: Dimensions.font12,
              ),
            ),


            /*Container(
              margin: EdgeInsets.only(
                  top: (controller.hasError && _errorText.isEmpty)
                      ? Dimensions.height10
                      : (( !controller.hasError && _errorText.isEmpty) ? 0 : Dimensions.height10  ) ,
                  bottom: Dimensions.height10 / 2
              ),
              child: BigText(
                text: (controller.hasError && _errorText.isEmpty)
                    ? "* Please enter ${widget.hint.toLowerCase()}"
                    : ((!controller.hasError &&  _errorText.isEmpty) ? "" : _errorText )  ,
                color: Colors.red,
                maxLines: 2,
                size: Dimensions.font12,
              ),
            ),*/

          ],
        );
      },
    );


  }

}
