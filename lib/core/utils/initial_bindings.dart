import 'package:e_learning/core/utils/pref_utils.dart';
import 'package:e_learning/data/apiClient/api_client.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    // Connectivity connectivity = Connectivity();
    // Get.put(NetworkInfo(connectivity));
  }
}
