import 'package:flutter/material.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/utils/strings.dart';
import 'package:three_sixty_kids/widgets/big_text.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller){
        return Center(
          child: Container(
            width: Dimensions.screenWidth - Dimensions.width30,
            height: Dimensions.screenHeight / 3,
            padding: EdgeInsets.all(Dimensions.width15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius12), // Adjust the corner radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        controller.setLoading(false);
                      },
                      child: Icon(
                        Icons.close, // Replace with your desired icon
                        size: Dimensions.iconSize32,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height16),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                ),
                SizedBox(height: Dimensions.height16),
                const BigText(
                  text: searchCenter,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}

