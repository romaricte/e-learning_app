
import 'package:e_learning/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {TextEditingController nameController = TextEditingController();

TextEditingController emailController = TextEditingController();

Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

@override void onClose() { super.onClose(); nameController.dispose(); emailController.dispose(); } 
 }
