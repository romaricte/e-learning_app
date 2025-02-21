// ignore_for_file: deprecated_member_use

import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/core/utils/pref_utils.dart';
import 'package:e_learning/theme/custom_text_style.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';
import 'package:e_learning/core/utils/image_constant.dart';
import 'controller/call_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/widgets/custom_icon_button.dart';



class CallDetailsScreen extends StatefulWidget {
  const CallDetailsScreen({super.key});

  @override
  State<CallDetailsScreen> createState() => _CallDetailsScreenState();
}

class _CallDetailsScreenState extends State<CallDetailsScreen> {
  CallDetailsController controller = Get.put(CallDetailsController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async{
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomImageView(
                  imagePath: ImageConstant.imgEllipse225164x164,
                  height: 164.adaptSize,
                  width: 164.adaptSize,
                  radius: BorderRadius.circular(
                    82.h,
                  ),
                ),
                SizedBox(height: 21.v),
                Text(
                  "lbl_esther_howards".tr,
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 12.v),
                Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: Text(
                    "lbl_13_35_min".tr,
                    style: CustomTextStyles.bodyLargeGray600,
                  ),
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildActions(),
      ),
    );
  }

  /// Section Widget
  Widget _buildActions() {
    return Padding(
      padding: EdgeInsets.only(
        left: 82.h,
        right: 82.h,
        bottom: 40.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.fillGray.copyWith(
              color: PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):appTheme.darkInput
            ),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgMicrophone,
            ),
          ),
          CustomIconButton(
            onTap: () {
              Get.back();
            },
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(6.h),
            decoration: IconButtonStyleHelper.fillRed,
            child: CustomImageView(
              imagePath: ImageConstant.imgCallWhiteA700,
            ),
          ),
          CustomIconButton(
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.fillGray.copyWith(
                color: PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):appTheme.darkInput
            ),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgMail,
            ),
          ),
        ],
      ),
    );
  }

}




