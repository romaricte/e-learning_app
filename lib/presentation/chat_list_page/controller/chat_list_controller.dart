import 'package:get/get.dart';
import 'package:e_learning/presentation/chat_list_page/models/chat_list_model.dart';

import '../models/userprofileinfo_item_model.dart';

/// A controller class for the ChatListPage.
///
/// This class manages the state of the ChatListPage, including the
/// current chatListModelObj
class ChatListController extends GetxController {
 List<UserprofileinfoItemModel> chatList = ChatListModel.getCahtList();
}
