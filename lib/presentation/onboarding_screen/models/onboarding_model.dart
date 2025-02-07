import 'package:e_learning/presentation/onboarding_screen/models/onboardingslider_item_model.dart';
import 'package:get/get.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingModel {
  Rx<List<OnboardingsliderItemModel>> onboardingsliderItemList =
      Rx(List.generate(1, (index) => OnboardingsliderItemModel()));
}

