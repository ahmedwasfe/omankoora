import 'package:amankoora/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  RxBool isLoading = false.obs;

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> verificationformKey;
  late TextEditingController phoneController;
  late TextEditingController pinController;



  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    verificationformKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    pinController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    verificationformKey.currentState!.dispose();
    formKey.currentState!.dispose();
    phoneController.dispose();
    pinController.dispose();
    super.dispose();
  }

  void login() {
    bool isValidate = formKey.currentState!.validate();
    if(isValidate){
      isLoading(true);
      Get.toNamed(Routes.verification);
    }else{
      isLoading(false);
    }

  }
}