import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/core/utils/image_constant.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());
  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup,
                        height: 89.v,
                        width: 104.h),
                    SizedBox(height: 20.v),
                    Text("lbl_e_learning_app".tr,
                        style: theme.textTheme.headlineMedium),
                    SizedBox(height: 5.v)
                  ])),
        ));
  }
}




