import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/dialog_controller.dart';
import 'package:three_sixty_kids/ui/center_details_page/widgets/center_deatail_category_view.dart';
import 'package:three_sixty_kids/ui/class_details_page/widgets/class_details_widgets.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/utils/valid_checker.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:three_sixty_kids/widgets/custom_edit_text.dart';
import 'package:three_sixty_kids/widgets/custom_text_button.dart';
import 'package:three_sixty_kids/widgets/custom_text_icon_button.dart';
import 'package:three_sixty_kids/widgets/join_center_app_bar.dart';


class ClassDetailPage extends StatelessWidget {
  const ClassDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    DialogController controller = Get.find<DialogController>();
    controller.fetchAgeRatesCheckboxesFromServer();
    TextEditingController _textFieldController1 = TextEditingController();
    TextEditingController _textFieldController2 = TextEditingController();    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: JoinAppBar(),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          children: [
            ClassImageAndBackView(),
            infoTimeTableAndDateWidget(),
            CenterDetailCategoryView(),
            centerDetailsTextView(),
            SizedBox(height:  Dimensions.height20  *  3,)

          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            _showAlertDialog(context, controller);
          },
          child: Container(
            height: Dimensions.height150 / 3,
            width: Dimensions.screenWidth - 30,
            //padding: EdgeInsets.all(Dimensions.width10),
            color: Colors.transparent,
            child: CustomTextButton(
              text: inquiry_class,
            ),
          ),
        ),


      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context, DialogController controller) async {
    TextEditingController _textFieldController1 = TextEditingController();
    TextEditingController _textFieldController2 = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.textColor,
                        size: Dimensions.iconSize24,
                      ),
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height15,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Fill Up ',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Dimensions.font14, // Font size for the first part
                          fontWeight: FontWeight.bold, // You can apply other styles too
                          color: AppColors.textColor,
                        ),
                      ),
                      TextSpan(
                        text: ' Parent\'s', // Second part of the text
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Dimensions.font14, // Font size for the second part
                          fontWeight: FontWeight.w400, // You can apply other styles too
                          color: AppColors.mainColor,
                        ),
                      ),
                      TextSpan(
                        text: ' Information ',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Dimensions.font14, // Font size for the first part
                          fontWeight: FontWeight.bold, // You can apply other styles too
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height15,),

              ],
            ),
          ),
          content: Container(
            width: Dimensions.screenWidth ,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomEditText(
                  height: Dimensions.height20 * 2,
                  controller: _textFieldController1,
                  hint: "Name",
                ),
                SizedBox(height: Dimensions.height15,),
                CustomEditText(
                  height: Dimensions.height20 * 2,
                  controller: _textFieldController2,
                  hint: "Phone",
                  inputType: TextInputType.number,
                ),


              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.setPhoneAndName("Bright", "27");
                _showAlertDialog2(context);
              },
              child: Container(
                height: Dimensions.height20 * 2,
                width: Dimensions.width100,
                child: CustomTextButton(
                  text: "Continue",
                  fontSize: Dimensions.font14,
                ),
              )
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAlertDialog2(BuildContext context) async {
    TextEditingController _textFieldController1 = TextEditingController();
    TextEditingController _textFieldController2 = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<DialogController>(
          builder: (controller){
            return AlertDialog(
              title:  Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.textColor,
                      size: Dimensions.iconSize24,
                    ),
                  )
                ],
              ),
              content: Container(
                width: Dimensions.screenWidth ,
                child: ListView(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fill Up ',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: Dimensions.font14, // Font size for the first part
                              fontWeight: FontWeight.bold, // You can apply other styles too
                              color: AppColors.textColor,
                            ),
                          ),
                          TextSpan(
                            text: ' Child\'s', // Second part of the text
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: Dimensions.font14, // Font size for the second part
                              fontWeight: FontWeight.w400, // You can apply other styles too
                              color: AppColors.mainColor,
                            ),
                          ),
                          TextSpan(
                            text: ' information and finish the enquiry  ',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: Dimensions.font14, // Font size for the first part
                              fontWeight: FontWeight.bold, // You can apply other styles too
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    CustomEditText(
                      height: Dimensions.height20 * 2,
                      controller: _textFieldController1,
                      hint: "Name",
                    ),
                    SizedBox(height: Dimensions.height20,),
                    CustomEditText(
                      height: Dimensions.height20 * 2,
                      controller: _textFieldController2,
                      hint: "Age",
                      inputType: TextInputType.number,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.isAgeSelected ?
                          Container() :  Column(
                            children: [
                              CustomTextIconButton(
                                text: "Please select age rates",
                                fontSize: Dimensions.font12,

                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                            ],
                          ),

                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int index = 0;
                                index < controller.ageList.length;
                                index++)
                                  GestureDetector(
                                    onTap: (){
                                      controller.updateAgeCheckbox(controller.ageList[index].id, !controller.ageList[index].isSelected );
                                      print(controller.ageList[index].isSelected);
                                    },
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          activeColor: AppColors.mainColor,
                                          value: controller.ageList[index].isSelected,
                                          onChanged: (value) {
                                            controller.updateAgeCheckbox(controller.ageList[index].id, !controller.ageList[index].isSelected );

                                          },
                                        ),
                                        SizedBox(width: Dimensions.width10/2), // Add the desired spacing
                                        Expanded(
                                          child: BigText(
                                            size: Dimensions.font14,
                                            text: controller.ageList[index].label,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();

                            },
                            child: Container(
                              height: Dimensions.height20 * 2,
                              width: Dimensions.width100,
                              child: CustomTextButton(
                                text: "Back",
                                color: Colors.white,
                                fontSize: Dimensions.font14,
                                borderColor: AppColors.textColor,
                                textColor: AppColors.textColor,
                              ),
                            )
                        ),
                        TextButton(
                            onPressed: () async {
                              controller.setKidNameAndAge("Ame", "3");
                              print("-----");
                              print(controller.name);
                              print(controller.phone);
                              print(controller.isAgeSelected);


                              if (controller.name.isEmpty ||
                                  controller.phone.isEmpty ||
                                  controller.kidAge.isEmpty ||
                                  controller.kidName.isEmpty ||
                                  !controller.isAnyAgeListCheckboxSelected()
                              ) {
                                Get.snackbar("Input Alert", "You need to fill all the information!",
                                    backgroundColor: AppColors.mainColor,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM
                                );
                              }
                              else{
                                // Send the data to the server
                                await controller.sendEnquiryToServer();
                                // Dismiss the second dialog
                                Navigator.pop(context);
                                // Dismiss the first dialog
                                Navigator.pop(context);
                                print("done done done");
                              }
                            },
                            child: Container(
                              height: Dimensions.height20 * 2,
                              width: Dimensions.width100,
                              child: CustomTextButton(
                                text: "Enquiry",
                                fontSize: Dimensions.font14,
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                ),

                /*child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

              ],
            ),*/
              ),
            );
          },
        );
      },
    );
  }
}

