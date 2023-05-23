import 'dart:io';
import 'dart:math';

import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'preferences_manager.dart';


class AppHelper {

  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  static String getCurrentTime(BuildContext context){
    final now = TimeOfDay.now();
    TimeOfDay time = TimeOfDay(hour: now.hour, minute: now.minute);
    final currentTime = time.format(context);
    return currentTime;
  }

  static String getDateTody(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
    // 2022-11-13
  }

  static void showToast({required String message, Color color = Colors.black, ToastGravity gravity = ToastGravity.BOTTOM}){
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!)
      return false;
    else
      return true;
  }

  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'يرجى إدخال إسمك'.tr;
    } else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'يرجى إدخال رقم الجوال'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else
      return null;
  }

  static String formatImage(String pathImage) {
    if(pathImage.contains('\\'))
      return pathImage.replaceAll('\\', '/');
    else
      return pathImage;
  }

  static void showLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            height: 300.h,
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                  child: AppText.medium(text:
                  'please_login'.tr,
                    color: HexColor(AppColors.appMainColor),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8.r),
                    height: 150.h,
                    width: 230.w,
                    child: Image.asset('${Const.images}login.png', fit: BoxFit.cover)),
                Spacer(),
                Container(
                    child: AppWidgets.CustomButton(
                        height: 52,
                        background: HexColor(AppColors.appMainColor),
                        borderColor: HexColor(AppColors.appMainColor),
                        text: 'login'.tr,
                        click: () => Get.offAndToNamed(''))),
              ],
            ),
          ),
        ));
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
