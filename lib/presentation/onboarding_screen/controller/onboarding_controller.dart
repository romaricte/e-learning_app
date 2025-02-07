import 'package:e_learning/presentation/onboarding_screen/models/onboarding_model.dart';
import 'package:get/get.dart';

///
/// This class manages the state of the OnboardingScreen, including the
/// current onboardingModel
class OnboardingController extends GetxController {
  Rx<OnboardingModel> onboardingModelObj = OnboardingModel().obs;

  Rx<int> sliderIndex = 0.obs;
}

