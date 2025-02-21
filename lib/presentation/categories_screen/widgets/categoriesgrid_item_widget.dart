import 'package:e_learning/presentation/categories_screen/controller/categories_controller.dart';
import 'package:e_learning/presentation/categories_screen/models/categoriesgrid_item_model.dart';
import 'package:e_learning/theme/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/widgets/custom_icon_button.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';


// ignore: must_be_immutable
class CategoriesgridItemWidget extends StatelessWidget {
  CategoriesgridItemWidget(
    this.categoriesgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoriesgridItemModel categoriesgridItemModelObj;

  var controller = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillIndigo.copyWith(
        color: categoriesgridItemModelObj.bgColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 54.adaptSize,
            width: 54.adaptSize,
            padding: EdgeInsets.all(11.h),
            decoration: IconButtonStyleHelper.fillWhiteATL27,
            child: CustomImageView(
              imagePath: categoriesgridItemModelObj.icon!,
            ),
          ),
SizedBox(height:16.v),
          Text(
            categoriesgridItemModelObj.title!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
