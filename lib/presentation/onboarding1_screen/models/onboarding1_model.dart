import 'package:e_learning/core/utils/image_constant.dart';


/// This class defines the variables used in the [onboarding1_screen],
import 'learningframe1_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class Onboarding1Model {
  static List<Learningframe1ItemModel> getOnboardingData() {
    return [
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding1,
          "Apprenez de nouvelles compétences et progressez dans votre carrière avec l'apprentissage",
          "L'apprentissage électronique, est la livraison de l'apprentissage et de la formation grâce aux ressources numériques."),
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding2,
          "Le moyen le plus pratique et efficace pour apprendre.",
          "L'apprentissage électronique, est la livraison de l'apprentissage et de la formation grâce aux ressources numériques."),
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding3,
          "Apprenez à votre propre rythme, avec l'apprentissage numérique.",
          "L'apprentissage électronique, est la livraison de l'apprentissage et de la formation grâce aux ressources numériques."),
    ];
  }
}
