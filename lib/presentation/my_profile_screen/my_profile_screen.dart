import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/routes/app_routes.dart';
import 'package:e_learning/theme/app_decoration.dart';
import 'package:e_learning/theme/custom_text_style.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/core/utils/image_constant.dart';
import 'package:e_learning/core/utils/pref_utils.dart';
import 'package:e_learning/widgets/app_bar/appbar_leading_image.dart';
import 'package:e_learning/widgets/app_bar/appbar_subtitle.dart';
import 'package:e_learning/widgets/app_bar/appbar_trailing_image.dart';
import 'package:e_learning/widgets/app_bar/custom_app_bar.dart';


import 'controller/my_profile_controller.dart';




class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
 MyProfileController  controller = Get.put(MyProfileController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
    backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                 _buildHeader(),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 16.h, vertical: 40.v),
                     child: Column(

                         children: [


                       Center(
                         child: CustomImageView(
                         imagePath: PrefUtils().getThemeData() == "primary"?ImageConstant.imgAvtar1:ImageConstant.imgAvtar1Dark,
                         height: 100.adaptSize,
                         width: 100.adaptSize),
                       ),

                      // Container(
                      //     height: 100.adaptSize,
                      //     width: 100.adaptSize,
                      //     padding: EdgeInsets.symmetric(vertical: 4.v),
                      //     decoration: BoxDecoration(
                      //       color: Colors.red,
                      //         image: DecorationImage(
                      //             image: fs.Svg(PrefUtils().getThemeData() == "primary"?ImageConstant.imgAvtar1:ImageConstant.imgAvtar1Dark,),
                      //             fit: BoxFit.cover)),
                      //     child: CustomIconButton(
                      //         height: 28.adaptSize,
                      //         width: 28.adaptSize,
                      //         padding: EdgeInsets.all(5.h),
                      //         decoration:
                      //         IconButtonStyleHelper.outlineBlackTL141,
                      //         alignment: Alignment.bottomRight,
                      //         child: CustomImageView(
                      //             imagePath:
                      //             ImageConstant.imgCameraOnprimary))),
                      SizedBox(height: 40.v),
                       _buildFrame("lbl_name".tr,"lbl_ronald_richards".tr),
                      SizedBox(height: 16.v),
                       _buildFrame("lbl_email_address".tr,"msg_ronaldrichards_gmail_com".tr),
                      SizedBox(height: 16.v),
                      _buildFrame("lbl_phone_number".tr,"lbl_405_555_0128".tr),
                      SizedBox(height: 5.v)
                     ]))
                ]))),
      ));
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
          height: 28.v,
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 3.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_my_profile".tr),
          actions: [
           AppbarTrailingImage(
               imagePath: ImageConstant.imgTicket,
               margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 4.v),
               onTap: () {
                onTapTicket();
               })
          ]));
 }

 /// Section Widget
 Widget _buildFrame(title, subtitle) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(title, style: CustomTextStyles.bodyMedium14),
           SizedBox(height: 11.v),
           Text(subtitle, style: theme.textTheme.bodyLarge)
          ]));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the editProfileScreen when the action is triggered.
 onTapTicket() {
  // Get.toNamed(
  // //  AppRoutes.editProfileScreen,
  // );
 }
}

