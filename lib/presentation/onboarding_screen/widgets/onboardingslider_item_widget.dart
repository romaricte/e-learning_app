import 'package:e_learning/presentation/onboarding_screen/controller/onboarding_controller.dart';
import 'package:e_learning/presentation/onboarding_screen/models/onboardingslider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/core/utils/size_utils.dart';

// ignore: must_be_immutable
class OnboardingsliderItemWidget extends StatelessWidget {
  OnboardingsliderItemWidget(
    this.onboardingsliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OnboardingsliderItemModel onboardingsliderItemModelObj;

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 370.h,
          child: Text(
            "msg_learn_new_skills".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium!.copyWith(
              height: 1.36,
            ),
          ),
        ),
        SizedBox(height: 15.v),
        Container(
          width: 301.h,
          margin: EdgeInsets.only(
            left: 32.h,
            right: 36.h,
          ),
          child: Text(
            "msg_electronic_learning".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
