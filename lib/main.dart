import 'package:amankoora/bindings/app_bindings.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utils/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkMainColor,
        statusBarBrightness: Brightness.light));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        theme: ThemeData(
            primarySwatch: AppColors.primaryColor,
            primaryColor: HexColor(AppColors.appMainColor)),
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        locale: const Locale('ar'),
        initialRoute: Routes.splash,
        getPages: AppRoutes.routesPages,
      ),
    );
  }
}
