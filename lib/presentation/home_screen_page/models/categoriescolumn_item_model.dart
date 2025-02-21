import 'package:e_learning/core/utils/image_constant.dart';
import 'package:get/get.dart';

class CategoriescolumnItemModel {CategoriescolumnItemModel({this.catDesigning, this.designingText, this.id, }) { catDesigning = catDesigning  ?? Rx(ImageConstant.imgCatDesigining);designingText = designingText  ?? Rx("Designing");id = id  ?? Rx(""); }

Rx<String>? catDesigning;

Rx<String>? designingText;

Rx<String>? id;

 }
