
import 'package:amankoora/controller/settings_controller.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  final SettingsController _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'عن التطبيق',
            color: Colors.white,
            textAlign: TextAlign.center),
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
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 26.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.larg(text: 'عن التطبيق'),
                    SizedBox(height: 8.r),
                    AppText.medium(
                      maxline: 20,
                      textAlign: TextAlign.start,
                      text: '${Const.defaultText}',),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.larg(
                        text: 'رؤيتنا'
                    ),
                    SizedBox(height: 8.r),
                    AppText.medium(
                      maxline: 20,
                      textAlign: TextAlign.start,
                      text: '${Const.defaultText}',),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.larg(
                        text: 'مهمتنا'
                    ),
                    SizedBox(height: 8.r),
                    AppText.medium(
                      maxline: 20,
                      textAlign: TextAlign.start,
                      text: '${Const.defaultText}',),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 16.r, bottom: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.larg(
                        text: 'خدماتنا'
                    ),
                    SizedBox(height: 8.r),
                    AppText.medium(
                      maxline: 20,
                      textAlign: TextAlign.start,
                      text: '${Const.defaultText}',),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
