import 'package:get/get.dart';
class Userprofilelist1ItemModel {Userprofilelist1ItemModel({this.userName, this.userRole, this.id, }) { userName = userName  ?? Rx("Ronald richards");userRole = userRole  ?? Rx("Instructor");id = id  ?? Rx(""); }

Rx<String>? userName;

Rx<String>? userRole;

Rx<String>? id;

 }
