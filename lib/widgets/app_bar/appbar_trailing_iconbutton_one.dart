import 'package:e_learning/core/utils/image_constant.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/widgets/custom_icon_button.dart';
import 'package:e_learning/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbuttonOne extends StatelessWidget {
  AppbarTrailingIconbuttonOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 36.adaptSize,
          width: 36.adaptSize,
          decoration: IconButtonStyleHelper.fillWhiteATL8,
          child: CustomImageView(
            imagePath: ImageConstant.imgFavoriteOnprimary36x36,
          ),
        ),
      ),
    );
  }
}
