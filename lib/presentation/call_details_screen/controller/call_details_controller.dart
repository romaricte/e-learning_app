import 'package:get/get.dart';
import 'package:e_learning/presentation/call_details_screen/models/call_details_model.dart';

/// A controller class for the CallDetailsScreen.
///
/// This class manages the state of the CallDetailsScreen, including the
/// current callDetailsModelObj
class CallDetailsController extends GetxController {
  Rx<CallDetailsModel> callDetailsModelObj = CallDetailsModel().obs;
}
