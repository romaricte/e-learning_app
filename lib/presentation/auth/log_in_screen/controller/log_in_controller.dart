import 'package:e_learning/presentation/auth/log_in_screen/models/log_in_model.dart';
import 'package:e_learning/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/services/auth_service.dart';

//
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
    TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  RxBool isLoading = false.obs;

  Rx<LogInModel> logInModelObj = LogInModel().obs;
  Rx<bool> isShowPassword = true.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;
      await _authService.signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.toNamed(AppRoutes.homeScreenContainerScreen); // Rediriger vers la page d'accueil
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Échec de la connexion',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
