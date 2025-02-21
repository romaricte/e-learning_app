import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/recentclearallrow_item_model.dart';
import '../models/search_model.dart';


class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<RecentclearallrowItemModel> searchList = SearchModel.getSearchData();
}
