import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/theme/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarTitleCircleimage extends StatelessWidget {
  AppbarTitleCircleimage({
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
    return InkWell(
      borderRadius: BorderRadiusStyle.circleBorder24,
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 50.adaptSize,
          width: 50.adaptSize,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            25.h,
          ),
        ),
      ),
    );
  }
}
