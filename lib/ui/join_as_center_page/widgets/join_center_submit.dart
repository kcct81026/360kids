import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';

class JoinCenterSubmitView extends StatelessWidget {
  const JoinCenterSubmitView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinCenterController>(
      builder: (controller){
        return Container(
          //height: Dimensions.height30 * 2,
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.height15
          ),
          child:  GestureDetector(
            onTap: (){
              if( (!controller.isAnyCategoryListCheckboxSelected() && !controller.isAnyAgeListCheckboxSelected())

                  || controller.getName().trim().isEmpty
                  || controller.getUserName().trim().isEmpty
                  || (controller.getPostalCode().trim().isEmpty &&  !controller.isValidNumber(controller.getPostalCode()))
                  || (controller.getPostalCode().trim().isEmpty &&  !controller.isValidNumber(controller.getPostalCode()))
                  || (controller.getUserPhone().trim().isEmpty && !controller.isValidNumber(controller.getUserPhone()))
                  || controller.getAddress().trim().isEmpty
                  || (controller.getEmail().trim().isEmpty && !controller.isValidEmail(controller.getEmail()))
                  || (controller.getUserEmail().trim().isEmpty && !controller.isValidEmail(controller.getUserEmail()))





              ){
                controller.updateErrorValue(true);
                print("not okay");
              }
              else{
                controller.updateErrorValue(false);
                print("okay");
              }

            },
            child: CustomTextButton(
              text: "Submit",
            ),
          ),
        );
      },
    );
  }
}
