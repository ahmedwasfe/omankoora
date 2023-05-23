import 'package:amankoora/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startApp() {
    return Future.delayed(
        const Duration(seconds: 5), () => Get.offAndToNamed(Routes.home));
  }
}