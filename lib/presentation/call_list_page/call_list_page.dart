import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/routes/app_routes.dart';

import '../call_list_page/widgets/chatlist_item_widget.dart';
import 'controller/call_list_controller.dart';
import 'models/chatlist_item_model.dart';

// ignore_for_file: must_be_immutable
class CallListPage extends StatefulWidget {
  CallListPage({Key? key}) : super(key: key);

  @override
  State<CallListPage> createState() => _CallListPageState();
}

class _CallListPageState extends State<CallListPage> {
  CallListController controller =
      Get.put(CallListController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ListView.separated(
      padding: EdgeInsets.all(16.h),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: controller.callData.length,
        itemBuilder: (context, index) {
          ChatlistItemModel model = controller
              .callData[index];
          return animationfunction(index, ChatlistItemWidget(model));
        });
  }



  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapTwentyEight() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }

  /// Navigates to the myCoursesScreen when the action is triggered.
  onTapMyCoursesColumn() {
    // Get.toNamed(
    //   AppRoutes.myCoursesScreen,
    // );
  }

  /// Navigates to the favoriteScreen when the action is triggered.
  onTapTwentyEight1() {
    // Get.toNamed(
    //   AppRoutes.favoriteScreen,
    // );
  }

  /// Navigates to the profileOneScreen when the action is triggered.
  onTapTwentyEight2() {
    // Get.toNamed(
    //   AppRoutes.profileOneScreen,
    // );
  }
}
