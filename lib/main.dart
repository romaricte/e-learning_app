import 'package:e_learning/core/utils/initial_bindings.dart';
import 'package:e_learning/core/utils/logger.dart';
import 'package:e_learning/routes/app_routes.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:get/get.dart';
import 'package:e_learning/localization/app_localization.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  debugShowCheckedModeBanner: false,
      theme: theme,
       translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('fr', 'FR'),
      title: 'e_learning',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,


    );
  }
}

