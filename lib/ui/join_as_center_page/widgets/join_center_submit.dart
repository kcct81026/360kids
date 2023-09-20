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
              //print(controller.hasError);

              if(controller.getName().trim().isEmpty
                  || controller.getPostalCode().trim().isEmpty
                  || controller.getPhone().trim().isEmpty
                  || controller.getAddress().trim().isEmpty
                  || controller.getEmail().trim().isEmpty
                  || !controller.isValidEmail(controller.getEmail())
                  || !controller.isValidNumber(controller.getPhone())
                  || !controller.isValidNumber(controller.getPostalCode())
                  || !controller.isAnyAgeListCheckboxSelected()
                  || !controller.isAnyCategoryListCheckboxSelected()


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
