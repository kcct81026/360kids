import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text_for_center.dart';

class TextFieldJoinCenterList extends StatelessWidget {

  const TextFieldJoinCenterList({super.key});

  @override
  Widget build(BuildContext context) {

    JoinCenterController controller = Get.find<JoinCenterController>();


    return  Container(
      margin: EdgeInsets.only(
        top: Dimensions.height20
      ),
     // width: double.maxFinite,
      //height: Dimensions.height250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomEditTextForCenter(
            controller: controller.nameController ,
            hint: "Center Name",
          ),

          CustomEditTextForCenter(
            controller: controller.addressController ,
            hint: "Center Address",
          ),

          Row(
            children: [
              Expanded(
                child: CustomEditTextForCenter(
                  controller: controller.phoneController ,
                  hint: "Center Phone",
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(width: Dimensions.width20,),

              Expanded(
                child: CustomEditTextForCenter(
                  controller: controller.postalCodeController ,
                  hint: "Center Postal Code",
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          CustomEditTextForCenter(
            controller: controller.emailController ,
            hint: "Email Address",
            inputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
