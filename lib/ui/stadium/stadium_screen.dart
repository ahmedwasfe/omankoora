import 'package:amankoora/controller/stadium_controller.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StadiumScreen extends StatelessWidget {
  final StadiumController _controller = Get.put(StadiumController());
  late final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'إستاد السيب',
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
      body: GetBuilder<StadiumController>(
          builder: (controller) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ImageSlideshow(
                            width: double.infinity,
                            height: 200,
                            initialPage: 0,
                            indicatorRadius: 5,
                            indicatorColor: HexColor(AppColors.appMainColor),
                            indicatorBackgroundColor: Colors.white70,
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: controller.listSliders
                                .map((element) => InkWell(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Image.network(
                                          '$element',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onTap: () {},
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 8.h),
                          Card(
                            margin: EdgeInsetsDirectional.only(
                                top: 20.r,
                                start: 10.r,
                                end: 10.r,
                                bottom: 30.r),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: 20.r, start: 30.r, end: 30.r),
                                  child: Row(
                                    children: [
                                      AppText.medium(text: 'إسم الملعب'),
                                      Spacer(),
                                      AppText.medium(
                                          text: 'إستاد السيب',
                                          fontSize: 18.sp,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.r, start: 10.r, end: 10.r),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: 20.r, start: 30.r, end: 30.r),
                                  child: Row(
                                    children: [
                                      AppText.medium(text: 'المحافظة'),
                                      Spacer(),
                                      AppText.medium(
                                          text: 'إسم المحافظة',
                                          fontSize: 18.sp,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.r, start: 10.r, end: 10.r),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: 20.r, start: 30.r, end: 30.r),
                                  child: Row(
                                    children: [
                                      AppText.medium(text: 'المنطقة'),
                                      Spacer(),
                                      AppText.medium(
                                          text: 'إسم المنطقة',
                                          fontSize: 18.sp,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.r, start: 10.r, end: 10.r),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: 20.r, start: 30.r, end: 30.r),
                                  child: Row(
                                    children: [
                                      AppText.medium(text: 'مساحة الملعب'),
                                      Spacer(),
                                      AppText.medium(
                                          text: '15,000 م',
                                          fontSize: 18.sp,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.r, start: 10.r, end: 10.r),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: 20.r, start: 30.r, end: 30.r),
                                  child: Row(
                                    children: [
                                      AppText.medium(
                                          text: 'الطاقة الإستيعابية'),
                                      Spacer(),
                                      AppText.medium(
                                          text: '18,500 شخص',
                                          fontSize: 18.sp,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.r, start: 10.r, end: 10.r),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsetsDirectional.only(
                                      top: 10.r, start: 30.r, end: 30.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText.medium(text: 'مميزات الملعب'),
                                      AppText.medium(
                                          text:
                                              'تفاصيل ومميزات الملعب,تفاصيل ومميزات الملعب,تفاصيل ومميزات الملعب,تفاصيل ومميزات الملعب',
                                          fontSize: 18.sp,
                                          maxline: 3,
                                          color: AppColors.lightGray),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsetsDirectional.all(30.r),
                                    child: AppWidgets.CustomButton(
                                        width: 200.w,
                                        text: 'تأكيد الحجز',
                                        radius: 28.r,
                                        click: () {}))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
