import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'تفاصيل الخبر',
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)
                )
              ),
              child: Image.network(
                Const.defaultSlider,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 26.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.larg(text: 'عنوان الخبر', fontSize: 24.sp),
                  SizedBox(height: 8.r),
                  AppText.medium(
                    maxline: 20,
                    textAlign: TextAlign.start,
                    text: '${Const.defaultText}${Const.defaultText}${Const.defaultText}${Const.defaultText}${Const.defaultText}',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
