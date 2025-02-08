import 'package:e_learning/presentation/auth/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {TextEditingController emailController = TextEditingController();

Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

@override void onClose() { super.onClose(); emailController.dispose(); } 
 }
