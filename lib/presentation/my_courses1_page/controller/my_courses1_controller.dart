import 'package:e_learning/presentation/my_courses1_page/models/my_courses1_model.dart';
import 'package:get/get.dart';

import '../models/fundlist_item_model.dart';


class MyCourses1Controller extends GetxController {
 List<FundlistItemModel> myCourcesList = MyCourses1Model.getMyCourcesList();
}
