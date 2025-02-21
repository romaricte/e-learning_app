import 'package:e_learning/presentation/home_screen_page/models/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/slidre_model.dart';

///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
 List<SliderData> sliderData = HomeScreenModel.getSliderData();
  HomeScreenController(this.homeScreenModelObj);
  TextEditingController searchController = TextEditingController();
  Rx<HomeScreenModel> homeScreenModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }
}
