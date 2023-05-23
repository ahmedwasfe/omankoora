import 'package:amankoora/controller/login_controller.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_helper.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(builder: (controller) => Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 120.r),
                        width: 120.w, height: 120.h,
                        child:  Image.network('https://i.postimg.cc/zBqXvBYt/test-logo.png', fit: BoxFit.contain, color: HexColor(AppColors.appMainColor))),
                    SizedBox(height: 10.r),
                    AppText.larg(text: 'تسجيل الدخول', fontSize: 20.sp)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(start: 30.r, top: 50.r, end: 20.r),
                child: AppText.larg(
                    color: Colors.black,
                    fontSize: 16.sp,
                    text: 'رقم الجوال'),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, top: 10.r, end: 20.r),
                height: 60,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r)
                  ),
                  elevation: 8,
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: HexColor(AppColors.appMainColor),
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(32).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontFamily: Const.appFont,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'يرجى إدخال رقم الجوال',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        helperMaxLines: 1,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.lightGray, width: 1.w),
                          borderRadius: BorderRadius.circular(32).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                          borderRadius: BorderRadius.circular(32).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 343.h,
                          minWidth: 48.w,
                        )),
                    validator: (phone) {
                      print('PHONE: $phone');
                      if(phone!.isEmpty){
                        String? validatePhone = AppHelper.validatePhone(phone: phone);
                        AppHelper.showToast(message: validatePhone!, color: HexColor(AppColors.appMainColor));
                      }


                      },
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsetsDirectional.all(30.r),
                  child: AppWidgets.CustomButton(
                      height: 60.h,
                      text: 'تسجيل الدخول',
                      radius: 28.r,
                      click: () => controller.login())),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Obx(() => controller.isLoading == true ? AppWidgets.CustomProgress() : Container())),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
