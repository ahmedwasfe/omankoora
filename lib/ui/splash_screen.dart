import 'package:amankoora/controller/splash_controller.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(AppColors.appMainColor),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Image.network('https://i.postimg.cc/zBqXvBYt/test-logo.png', fit: BoxFit.contain,),
                width: 120.w, height: 120.h),
                SizedBox(height: 10.r),
                AppText.larg(text: 'عمان كوورة', color: Colors.white, fontSize: 20.sp)
              ],
            ),
          ),
          Image.asset('${Const.images}soccer_goal.png')
        ],
      ),
    );
  }
}
