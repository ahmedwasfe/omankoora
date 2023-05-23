import 'package:amankoora/controller/home_controller.dart';
import 'package:amankoora/controller/home_page_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  final HomeController _homeController = Get.find();
  final HomePageController _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: GetBuilder<HomePageController>(builder: (controller) => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              InkWell(
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsetsDirectional.only(
                        top: 12.r, start: 12.r, end: 12.r),
                    padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                    decoration: BoxDecoration(
                      color: HexColor(AppColors.formSearchColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: Const.appFont
                      ),
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          enabled: false,
                          hintText: 'بحث',
                          filled: true,
                          fillColor: HexColor(AppColors.formSearchColor),
                          hintStyle: const TextStyle(
                            color: Color(0xff9B9B9B),
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(AppColors.formSearchColor),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 343.w,
                            maxHeight: 50.h,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(AppColors.formSearchColor),
                                width: 1.w
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          prefixIcon: Container(
                            width: 18,
                            height: 18,
                            child: Image.asset('${Const.icons}icon_search.png',width: 18,
                              height: 18,),
                          )),
                    )),
                onTap: () => Get.toNamed(Routes.search),
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 16.r, top: 10.r, bottom: 10.r),
                    child: AppText.larg(text: 'أحدث الأخبار',
                    fontSize: 20.sp),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: ImageSlideshow(
                        width: 360,
                        height: 170,
                        initialPage: 0,
                        indicatorColor: Colors.transparent,
                        indicatorBackgroundColor: Colors.transparent,
                        autoPlayInterval: 5000,
                        isLoop: true,
                        children: controller.listSliders
                            .map((element) => InkWell(
                              child: Stack(
                                clipBehavior: Clip.antiAlias,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.network(
                                      '${element}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.black38,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsetsDirectional.only(start: 14.r, bottom: 20.r),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: AppText.larg(text: 'عنوان الخبر',
                                              color: Colors.white),
                                        ),
                                        Container(
                                          child: AppText.medium(text: 'نص افتراضي لتفاصيل الخبر الذي سوف يعرض هنا',
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 16.r, top: 10.r, bottom: 10.r, start: 16.r),
                    child: Row(
                      children: [
                        AppText.larg(text: 'أحدث البطولات',
                            fontSize: 20.sp),
                        Spacer(),
                        InkWell(
                            child: AppText.medium(text: 'عرض الكل'),
                            onTap: () => _homeController.getCurrenDrawerIndex(drawerIndex: 1))

                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) => buildChampionshipsItem())
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 16.r, top: 10.r, bottom: 10.r, start: 16.r),
                    child: Row(
                      children: [
                        AppText.larg(text: 'أحدث المباريات',
                            fontSize: 20.sp),
                        Spacer(),
                        InkWell(
                            child: AppText.medium(text: 'عرض الكل'),
                            onTap: () {})
                      ],
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) => buildMatchesItem())
                ],
              ),
            ],
          ),
        )));
  }

  Widget buildChampionshipsItem() => Container(
    width: double.infinity,
    height: 80,
    margin: EdgeInsetsDirectional.only(end: 12.r, top: 4.r, bottom: 4.r, start: 12.r),
    child: InkWell(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r)
        ),
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10.w),
                Image.asset('${Const.images}league_logo.png'),
                AppText.medium(text: 'دوري أبطال أوروبا')
              ],
            ),
          )),
      onTap: () => Get.toNamed(Routes.matches),
    ),
  );

  Widget buildMatchesItem() => Container(
    width: double.infinity,
    height: 120,
    margin: EdgeInsetsDirectional.only(end: 12.r, top: 6.r, bottom: 6.r, start: 12.r),
    child: InkWell(
      child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(start: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'نادي مسقط'),
                    Image.asset('${Const.images}league_logo.png')
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'اليوم الساعة',
                    fontSize: 10.sp),
                    AppText.medium(text: '10:00 PM',
                        fontSize: 14.sp),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(end: 16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('${Const.images}league_logo.png'),
                    AppText.medium(text: 'نادي السيب')
                  ],
                ),
              ),
            ],
          )),
      onTap: () => Get.toNamed(Routes.match),
    ),
  );
}
