import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text_for_center.dart';

class FillCenterUserInfoView extends StatelessWidget {
  const FillCenterUserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    JoinCenterController controller = Get.find<JoinCenterController>();

    return Container(
      margin: EdgeInsets.all(Dimensions.width10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height15,),

          BigText(
            text: fill_user_info,
            fontWeight: FontWeight.w500,
            size: Dimensions.font16,
            maxLines: 3,
          ),
          SizedBox(height: Dimensions.height15,),

          BigText(
            text: user_alert_info,
            color: Colors.grey,
            size: Dimensions.font14,
            maxLines: 3,
          ),
          SizedBox(height: Dimensions.height15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomEditTextForCenter(
                editingController: controller.userNameController ,
                hint: "Name",
              ),

              CustomEditTextForCenter(
                editingController: controller.userPhoneController ,
                inputType: TextInputType.number,
                hint: "Phone",
              ),

              CustomEditTextForCenter(
                editingController: controller.userEmailController ,
                inputType: TextInputType.emailAddress,
                hint: "Email",
              ),
            ],
          )
        ],
      ),
    );
  }
}
