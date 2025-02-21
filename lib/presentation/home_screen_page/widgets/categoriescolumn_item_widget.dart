import 'package:e_learning/theme/app_decoration.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';
import 'package:get/get.dart';

import '../controller/home_screen_controller.dart';
import '../models/categoriescolumn_item_model.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/widgets/custom_icon_button.dart';
import 'package:e_learning/core/utils/size_utils.dart';
// ignore: must_be_immutable
class CategoriescolumnItemWidget extends StatelessWidget {
  CategoriescolumnItemWidget(
    this.categoriescolumnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoriescolumnItemModel categoriescolumnItemModelObj;

  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillIndigo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      width: 87.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => CustomIconButton(
              height: 47.adaptSize,
              width: 47.adaptSize,
              padding: EdgeInsets.all(11.h),
              decoration: IconButtonStyleHelper.fillWhiteA,
              child: CustomImageView(
                imagePath: categoriescolumnItemModelObj.catDesigning!.value,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          Obx(
            () => Text(
              categoriescolumnItemModelObj.designingText!.value,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
