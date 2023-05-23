
import 'package:amankoora/controller/home_controller.dart';
import 'package:amankoora/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HomeController());
  }
}
