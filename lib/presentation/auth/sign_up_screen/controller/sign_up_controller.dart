import 'package:e_learning/routes/app_routes.dart';
import 'package:e_learning/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/presentation/auth/sign_up_screen/models/sign_up_model.dart';

///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  RxBool isLoading = false.obs;

  Rx<bool> isShowPassword = true.obs;

  final AuthService _authService = Get.find<AuthService>();

  Future<void> signUp() async {
    try {
      isLoading.value = true;
      await _authService.signUp(
        email: emailController.text,
        password: passwordController.text,
        fullName: fullNameController.text,
      );
      Get.toNamed(AppRoutes.logInScreen);
    } on AuthException catch (e) {
      Get.snackbar(
        'Erreur',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      print('Erreur inattendue lors de l\'inscription: $e');
      print('StackTrace: $stackTrace');
      
      Get.snackbar(
        'Erreur',
        'Une erreur inattendue est survenue',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onClose() {
    super.onClose();
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
