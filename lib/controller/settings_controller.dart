import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsController extends GetxController{

  RxBool isLoading = false.obs;
  XFile? problemImage;

  late GlobalKey<FormState> formKey;
  late TextEditingController subjectController;
  late TextEditingController messageController;


  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> getSettings() async {
    // await ApiRequestes.getSettings(language: AppHelper.getAppLanguage())
    //     .then((value) {
    //   if (value != null) {
    //     settings = value.data!;
    //     update();
    //   }
    // });
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    problemImage = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void requestStoragePermissions() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("STORAGE permission: ${statuses[Permission.storage]}");
      pickImage();
    }else
      pickImage();
  }

}