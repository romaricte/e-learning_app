import 'package:e_learning/core/utils/image_constant.dart';
import 'package:get/get.dart';

class Userprofilelist2ItemModel {Userprofilelist2ItemModel({this.userImage, this.learnNewSkillsText, this.priceCircleImage, this.instructorNameText, this.instructorTitleText, this.priceText, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgGroupIndianCh114x114);learnNewSkillsText = learnNewSkillsText  ?? Rx("Learn new skills, advance your career");priceCircleImage = priceCircleImage  ?? Rx(ImageConstant.imgEllipse20491);instructorNameText = instructorNameText  ?? Rx("Esther howards");instructorTitleText = instructorTitleText  ?? Rx("Instructor");priceText = priceText  ?? Rx("80.00");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? learnNewSkillsText;

Rx<String>? priceCircleImage;

Rx<String>? instructorNameText;

Rx<String>? instructorTitleText;

Rx<String>? priceText;

Rx<String>? id;

 }
