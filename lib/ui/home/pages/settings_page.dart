import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 50.r, start: 22.r),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.sp,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 10.w,
                            height: 10.h,
                            child: Image.asset('${Const.icons}icon_about_app.png', width: 10, height: 10,)),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      AppText.medium(
                          text: "عن التطبيق",
                          fontSize: 18.sp)
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.aboutUs),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 50.r, start: 22.r),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.sp,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 10.w,
                            height: 10.h,
                            child: Image.asset('${Const.icons}icon_terms.png', width: 10, height: 10,)),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      AppText.medium(
                          text: "سياسة الخصوصية",
                          fontSize: 18.sp)
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.privacyPolicy),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 50.r, start: 22.r),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.sp,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 10.w,
                            height: 10.h,
                            child: Image.asset('${Const.icons}icon_contact_us.png', width: 10, height: 10,)),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      AppText.medium(
                          text: "تواصل معنا",
                          fontSize: 18.sp)
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.contactUs),
                ),
              )
            ],
          ),
        ));
  }
}
