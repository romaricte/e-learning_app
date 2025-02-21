import 'package:get/get.dart';
import 'package:e_learning/presentation/chats_page/models/chats_model.dart';

/// A controller class for the ChatsPage.
///
/// This class manages the state of the ChatsPage, including the
/// current chatsModelObj
class ChatsController extends GetxController {
  ChatsController(this.chatsModelObj);

  Rx<ChatsModel> chatsModelObj;
}
