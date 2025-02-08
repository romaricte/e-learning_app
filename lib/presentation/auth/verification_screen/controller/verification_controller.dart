import 'package:e_learning/presentation/auth/verification_screen/models/verification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

///
/// This class manages the state of the VerificationScreen, including the
/// current verificationModelObj
class VerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerificationModel> verificationModelObj = VerificationModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
