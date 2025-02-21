
import 'package:e_learning/presentation/categories_screen/models/categories_model.dart';
import 'package:get/get.dart';

import '../models/categoriesgrid_item_model.dart';

/// A controller class for the CategoriesScreen.
///
/// This class manages the state of the CategoriesScreen, including the
/// current categoriesModelObj
class CategoriesController extends GetxController {
 List<CategoriesgridItemModel> categories = CategoriesModel.getCategoriesData();
}
