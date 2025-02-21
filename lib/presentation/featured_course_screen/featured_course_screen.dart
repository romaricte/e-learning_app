// ignore_for_file: deprecated_member_use

import 'package:e_learning/theme/app_decoration.dart';
import 'package:e_learning/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/core/utils/pref_utils.dart';
import 'package:e_learning/widgets/custom_image_view.dart';
import 'package:e_learning/core/utils/image_constant.dart';
import 'package:e_learning/theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/featured_course_controller.dart';
import 'models/favoritegrid_item_model.dart';
import 'package:e_learning/routes/app_routes.dart';


class FeaturedCourseScreen extends StatefulWidget {
  const FeaturedCourseScreen({super.key});

  @override
  State<FeaturedCourseScreen> createState() => _FeaturedCourseScreenState();
}

class _FeaturedCourseScreenState extends State<FeaturedCourseScreen> {
 FeaturedCourseController featuredCourseController = Get.put(FeaturedCourseController());
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
          child: SizedBox(
              width: double.maxFinite,
              child: GetBuilder<FeaturedCourseController>(
                init: FeaturedCourseController(),
                builder:(controller) =>  Column(children: [
                 _buildHeader(),
                 SizedBox(height: 24.v),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 238.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.h,
                                  crossAxisSpacing: 16.h),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.featuredCourceList.length,
                              itemBuilder: (context, index) {
                                FavoritegridItemModel model = controller
                                    .featuredCourceList[index];
                                return animationfunction(index, FavoritegridItemWidget(model, onTapFund: () {
                                  onTapFund();
                                }));
                              }))),
                  SizedBox(height: 24.v),
                ]),
              )),
        )),
  );
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 1.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_featured_course".tr)));
 }

 /// Section Widget
 // Widget _buildFavoriteGrid() {
 //  return Expanded(
 //      child: Padding(
 //          padding: EdgeInsets.symmetric(horizontal: 16.h),
 //          child: Obx(() => GridView.builder(
 //              shrinkWrap: true,
 //              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
 //                  mainAxisExtent: 238.v,
 //                  crossAxisCount: 2,
 //                  mainAxisSpacing: 16.h,
 //                  crossAxisSpacing: 16.h),
 //              physics: BouncingScrollPhysics(),
 //              itemCount: controller.featuredCourseModelObj.value
 //                  .favoritegridItemList.value.length,
 //              itemBuilder: (context, index) {
 //               FavoritegridItemModel model = controller
 //                   .featuredCourseModelObj
 //                   .value
 //                   .favoritegridItemList
 //                   .value[index];
 //               return FavoritegridItemWidget(model, onTapFund: () {
 //                onTapFund();
 //               });
 //              }))));
 // }

 /// Navigates to the courseDetailsAboutScreen when the action is triggered.
 onTapFund() {
  // Get.toNamed(AppRoutes.courseDetailsAboutScreen);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}





