import 'package:flutter/material.dart';
import 'package:e_learning/widgets/app_bar/appbar_subtitle.dart';
import 'package:e_learning/widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../my_courses1_page/widgets/fundlist_item_widget.dart';
import 'controller/my_courses1_controller.dart';
import 'models/fundlist_item_model.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/core/utils/image_constant.dart';
import 'package:e_learning/core/utils/pref_utils.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/routes/app_routes.dart';


// ignore_for_file: must_be_immutable
class MyCourses1Page extends StatefulWidget {
  MyCourses1Page({Key? key}) : super(key: key);

  @override
  State<MyCourses1Page> createState() => _MyCourses1PageState();
}

class _MyCourses1PageState extends State<MyCourses1Page> {
  MyCourses1Controller controller = Get.put(MyCourses1Controller());
  CustomBottomBarController customBottomBarController =
      Get.put(CustomBottomBarController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<MyCourses1Controller>(
      init: MyCourses1Controller(),
      builder: (controller) => controller.myCourcesList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAppBar(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 56.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: PrefUtils().getThemeData() == "primary"
                            ? ImageConstant.imgGroup34160Indigo5002154x154
                            : ImageConstant.imgNoCourceDarkIcon,
                        height: 154.adaptSize,
                        width: 154.adaptSize,
                      ),
                      SizedBox(height: 26.v),
                      Text(
                        "lbl_no_course_yet".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 11.v),
                      SizedBox(
                        width: 312.h,
                        child: Text(
                          "msg_you_have_successfully".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                      SizedBox(height: 28.v),
                      CustomElevatedButton(
                        onPressed: () {
                          customBottomBarController.getIndex(0);
                        },
                        text: "Go to home",
                        margin: EdgeInsets.only(
                          left: 33.h,
                          right: 31.h,
                        ),
                      ),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
                SizedBox()
              ],
            )
          : Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.v);
                      },
                      itemCount: controller.myCourcesList.length,
                      itemBuilder: (context, index) {
                        FundlistItemModel model =
                            controller.myCourcesList[index];
                        return FundlistItemWidget(model, onTapFund: () {
                          onTapFund();
                        });
                      }),
                )
              ],
            ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_my_courses".tr));
  }

  /// Navigates to the courseDetailsScreen when the action is triggered.
  onTapFund() {
    // Get.toNamed(
    //   AppRoutes.courseDetailsScreen,
    // );
  }
}
