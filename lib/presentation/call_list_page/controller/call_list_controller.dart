import 'package:get/get.dart';
import 'package:e_learning/presentation/call_list_page/models/call_list_model.dart';

import '../models/chatlist_item_model.dart';

/// A controller class for the CallListPage.
///
/// This class manages the state of the CallListPage, including the
/// current callListModelObj
class CallListController extends GetxController {
 List<ChatlistItemModel> callData = CallListModel.getCallData();
}
