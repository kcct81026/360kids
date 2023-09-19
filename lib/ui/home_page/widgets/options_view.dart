import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController postalCodeController = TextEditingController();
    return GetBuilder<HomeController>(
      builder: (controller){
        postalCodeController.text = controller.getPostalCode.toString();
        return Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomEditText(
                      controller: postalCodeController,
                      color: Colors.white,
                      hint: postalCode,
                      inputType: TextInputType.text,
                      height: Dimensions.height100/2,

                    ),
                  ),
                  SizedBox(width: Dimensions.width10,),
                  controller.options.isEmpty
                   ? Container(width: Dimensions.height40, height: Dimensions.height40 , child: CircularProgressIndicator(),) // Show loading indicator
                  : Container(
                      height: Dimensions.height100/2,
                      //width: Dimensions.width30 * 5, // Customize the width as needed
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.circular(Dimensions.radius10 / 2),
                        border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          value: controller.selectedOptions,
                          onChanged: (newValue) {
                            controller.updateSelectedValue(newValue ?? "");
                            /* setState(() {
                              selectedValue = newValue ?? "no value";
                            });*/
                          },
                          items: controller.options.map(
                                (String option) {
                              //selectedValue = controller.options[0];

                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: Dimensions.font14,
                                    fontFamily: "Poppins",
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none, // Remove underline
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          dropdownColor: Colors.white, // Set the background color
                        ),
                      ],
                    ),

                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10/2,),
              GestureDetector(
                onTap: (){
                  if(!postalCodeController.value.text.isEmpty){
                    controller.searchList(postalCodeController.value.text);
                  }

                },
                child: CustomTextButton(
                  text: "Search",

                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
