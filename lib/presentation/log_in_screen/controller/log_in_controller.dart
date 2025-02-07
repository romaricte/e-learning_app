import 'package:e_learning/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  Rx<LogInModel> logInModelObj = LogInModel().obs;
  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailFieldController.clear();
    passwordFieldController.clear();
  }
}
