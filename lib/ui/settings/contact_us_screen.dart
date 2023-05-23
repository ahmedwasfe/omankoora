import 'dart:io';

import 'package:amankoora/controller/settings_controller.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_helper.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  final SettingsController _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'تواصل معنا',
            color: Colors.white),
        toolbarHeight: 80.h,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 23,
          ),
        ),
      ),
      body: Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.medium(text: 'عنوان المشكلة'),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: _controller.subjectController,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: 'أدخل عنوان المشكلة'.tr,
                          filled: true,
                          fillColor: Color(0xffFFFFFF),
                          hintStyle: TextStyle(
                            color: Color(0xffD3D6D9),
                            fontSize: 14.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                          // focusColor: Colors.red,
                          constraints: BoxConstraints(
                            maxWidth: 343.w,
                            maxHeight: 50.h,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightGray,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                        ),
                        validator: (value) {
                          if (!AppHelper.validate(value: value!)) {
                            AppHelper.showToast(
                                message: 'أدخل عنوان المشكلة'.tr,
                                color: Colors.redAccent);
                            _controller.isLoading(false);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.medium(text: 'وصف المشكلة'),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: _controller.messageController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: 'أدخل وصف المشكلة'.tr,
                          filled: true,
                          fillColor: Color(0xffFFFFFF),
                          hintStyle: TextStyle(
                            color: Color(0xffD3D6D9),
                            fontSize: 14.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // focusColor: Colors.red,
                          constraints: BoxConstraints(
                            maxWidth: 343.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (!AppHelper.validate(value: value!)) {
                            AppHelper.showToast(
                                message: 'أدخل وصف المشكلة'.tr,
                                color: Colors.redAccent);
                            _controller.isLoading(false);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: GetBuilder<SettingsController>(
                      builder: (controller) => Column(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: InkWell(
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    child: Container(
                                      width: 160,
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 8, end: 8, top: 6, bottom: 6),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            '${Const.icons}icon_problem_image.png',
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                          SizedBox(width: 4.w),
                                          AppText.medium(
                                              text: 'أضف صورة للمشكلة',
                                              fontSize: 12.sp,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () => controller.requestStoragePermissions(),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Container(
                                  width: 120.w,
                                  height: 80.h,
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsetsDirectional.only(
                                      start: 8.r, top: 8.r),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: controller.problemImage == null
                                      ? Image.network(Const.defaultSlider,
                                          fit: BoxFit.cover)
                                      : Image.file(
                                          File(controller.problemImage!.path),
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          )),
                ),
                SizedBox(height: 80.w),
                AppWidgets.CustomButton(
                    text: 'إرسال',
                    fontfamily: Const.appFont,
                    fontWeight: FontWeight.bold,
                    isUpperCase: false,
                    background: HexColor(AppColors.appMainColor),
                    borderColor: HexColor(AppColors.appMainColor),
                    radius: 30.r,
                    width: 200.h,
                    height: 50.h,
                    click: () {
                      // _controller.sendContactUs();
                    }),
                SizedBox(height: 20.w),
                Obx(() => _controller.isLoading == true
                    ? AppWidgets.CustomProgress()
                    : Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
