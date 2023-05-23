import 'package:amankoora/controller/matches_controller.dart';
import 'package:amankoora/model/days.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_helper.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MatchesScreen extends StatelessWidget {

  final MatchesController _controller = Get.put(MatchesController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'المباريات',
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
      body: GetBuilder<MatchesController>(builder: (controller) => DefaultTabController(
        length: 3,
        initialIndex: controller.tabIndex,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
              width: 350,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50).r,
                  color: const Color(0xffF8F6FB)
              ),
              child: ButtonsTabBar(
                onTap: (index) {
                  controller.tabIndex = index;
                  controller.update();
                },
                physics: const NeverScrollableScrollPhysics(),
                buttonMargin: const EdgeInsets.only(left: 10, top: 4, bottom: 4, right: 10),
                radius: 50,
                backgroundColor: HexColor(AppColors.appMainColor),
                unselectedBackgroundColor: const Color(0xffF8F6FB),
                // unselectedLabelStyle: TextStyle(color: HexColor(AppColors.appMainColor),fontSize: 16.h,fontWeight: FontWeight.w400),
                // labelStyle: TextStyle(color: Colors.white,fontSize: 16.h,fontWeight: FontWeight.w400),
                tabs: [
                  Tab(
                    icon: Container(
                        margin: const EdgeInsets.all(4),
                        alignment: AlignmentDirectional.center,
                        width: 80.w,
                        height: 50 .h,
                        child: AppText.medium(text: 'المباريات', color: controller.tabIndex == 0 ? Colors.white : HexColor(AppColors.appMainColor), textAlign: TextAlign.center)),
                    text: "",
                  ),
                  Tab(
                    icon: Container(
                        margin: const EdgeInsets.all(4),
                        alignment: AlignmentDirectional.center,
                        width: 80.w,
                        height: 50 .h,
                        child: AppText.medium(text: 'الترتيب', color: controller.tabIndex == 1 ? Colors.white : HexColor(AppColors.appMainColor), textAlign: TextAlign.center)),
                    text: "",
                  ),
                  Tab(
                    icon: Container(
                      width: 80.w,
                      height: 50 .h,
                      margin: const EdgeInsets.all(4),
                      child: AppText.medium(text: 'الهدافين', color: controller.tabIndex == 2 ? Colors.white : HexColor(AppColors.appMainColor), textAlign: TextAlign.center),),
                    text: "",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 8.r, right: 8.r),
                      child: Column(
                        children: [
                          controller.tabIndex == 0  ? Container(
                            margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: GetBuilder<MatchesController>(builder: (daysController) => Row(
                                children: daysController.listDays.map((day) => Card(
                                  elevation: 8,
                                  color: day.isSelected! ? HexColor(AppColors.appMainColor)  : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.r),
                                      side: BorderSide(color: day.isSelected! ? Colors.white : HexColor(AppColors.appMainColor), width: 1)
                                  ),
                                  child: InkWell(
                                    child: Container(
                                      width: 50.r,
                                      height: 50.r,
                                      margin: EdgeInsets.all(4.r),
                                      child: CircleAvatar(
                                        backgroundColor: day.isSelected! ? HexColor(AppColors.appMainColor)  : Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 4),
                                            AppHelper.getDateTody() == day.fullDate
                                                ? Container()
                                                : AppText.larg(text: day.date!, fontSize: 12.sp, color: day.isSelected! ? Colors.white : Colors.black),
                                            AppHelper.getDateTody() == day.fullDate
                                                ? AppText.larg(text: 'اليوم', fontSize: 12.sp, color: day.isSelected! ? Colors.white : Colors.black)
                                                : AppText.medium(text: day.day!, fontSize: 10.sp, color: day.isSelected! ? Colors.white : Colors.black)
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      for(Days days in controller.listDays) {
                                        days.isSelected = false;
                                      }
                                      day.isSelected = true;
                                      controller.update();
                                    },
                                  ),
                                )).toList(),
                              ),),
                            ),
                          ) : Container(),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 20,
                                itemBuilder: (context, index) => buildMatchesItem()),
                          ),
                        ],
                      )
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 8.r, right: 8.r),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8.r, right: 6.r),
                              width: double.infinity,
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 4.w),
                                  AppText.larg(text: '#',fontSize: 14.sp),
                                  Container(margin: EdgeInsets.only(left: 12, right: 8), height: 40.h, width: 1.w, color: Colors.grey),
                                  Expanded(child: AppText.larg(text: 'الفريق', fontSize: 12.sp)),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText.larg(text: 'فوز', fontSize: 12.sp),
                                        AppText.larg(text: 'تعادل', fontSize: 12.sp),
                                        AppText.larg(text: 'خسارة', fontSize: 12.sp),
                                        AppText.larg(text: 'النقاط', fontSize: 12.sp),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 20,
                                  itemBuilder: (context, index) => buildRankingItem(index),
                                  separatorBuilder: (context, index) => const Divider(color: Colors.grey)),
                            ),
                          ],
                        )
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 8.r, right: 8.r),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8.r, right: 6.r),
                              width: double.infinity,
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 4.w),
                                  AppText.larg(text: '#',fontSize: 14.sp),
                                  Container(margin: EdgeInsets.only(left: 12, right: 8), height: 40.h, width: 1.w, color: Colors.grey),
                                  Expanded(child: AppText.larg(text: 'اللاعب', fontSize: 12.sp)),
                                  Spacer(),
                                  AppText.larg(text: 'الأهداف', fontSize: 12.sp),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 20,
                                  itemBuilder: (context, index) => buildScorersItem(index),
                                  separatorBuilder: (context, index) => const Divider(color: Colors.grey)),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

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

  buildRankingItem(int index) => Container(
    margin: EdgeInsets.only(left: 12.r, right: 8.r),
    width: double.infinity,
    height: 48,
    color: Colors.white,
    child: Row(
      children: [
        SizedBox(width: 4.w),
        AppText.larg(text: '${index + 1}',fontSize: 14.sp),
        Container(margin: EdgeInsets.only(left: 8, right: 8), height: 40.h, width: 1.w, color: Colors.grey),
        CircleAvatar(
          radius: 10.r,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(index % 2 == 0 ? '${Const.images}mufc.png' : '${Const.images}lfc.png')),
        SizedBox(width: 4.w),
        Expanded(child: AppText.larg(text: index % 2 == 0 ? 'مانشستر يونايتد' : 'ليفربول', fontSize: 12.sp)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.larg(text: '8', fontSize: 12.sp),
              AppText.larg(text: '2', fontSize: 12.sp),
              AppText.larg(text: '4', fontSize: 12.sp),
              AppText.larg(text: '26', fontSize: 12.sp),
            ],
          ),
        ),
      ],
    ),
  );

  buildScorersItem(int index) => Container(
    margin: EdgeInsets.only(left: 12.r, right: 8.r),
    width: double.infinity,
    height: 48,
    color: Colors.white,
    child: Row(
      children: [
        SizedBox(width: 4.w),
        AppText.larg(text: '${index + 1}',fontSize: 14.sp),
        Container(margin: EdgeInsets.only(left: 8, right: 8), height: 40.h, width: 1.w, color: Colors.grey),
        CircleAvatar(
            radius: 10.r,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(index % 2 == 0 ? '${Const.images}mufc.png' : '${Const.images}lfc.png')),
        SizedBox(width: 4.w),
        Expanded(child: AppText.larg(text: index % 2 == 0 ? 'كريستيانو رونالدو' : 'محمد صلاح', fontSize: 12.sp)),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.larg(text: '26', fontSize: 12.sp),
          ],
        ),
      ],
    ),
  );
}
