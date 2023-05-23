import 'package:amankoora/controller/match_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MatchScreen extends StatelessWidget{
  final MatchController _controller = Get.put(MatchController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'المباراة',
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
      body: GetBuilder<MatchController>(builder: (controller) => DefaultTabController(
          length: 3,
          initialIndex: controller.tabIndex,
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 50.r),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 4.r),
                              child: Image.asset('${Const.images}afc.png', fit: BoxFit.cover,)),
                          AppText.larg(text: 'أرسنال'),
                          Container(
                            margin: EdgeInsets.only(top: 4.r),
                            width: 80.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: HexColor(AppColors.appMainColor),
                                borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('${Const.icons}icon_statdium.png'),
                                Container(margin: EdgeInsets.only(top: 4.r), child: AppText.medium(text: '4-2-4', color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    color: HexColor(AppColors.tabColor),
                                    width: 60.w,
                                    height: 60.h,
                                    child: AppText.larg(text: '1', fontSize: 22.sp, color: Colors.red)),
                                Container(height: 60, width: 2, color: AppColors.lightBlue5),
                                Container(
                                    alignment: Alignment.center,
                                    width: 60.w,
                                    height: 60.h,
                                    child: AppText.larg(text: '2', fontSize: 22.sp, color: Colors.green)),
                              ],
                            )),
                        SizedBox(height: 18.h),
                        AppText.larg(text: '35:45', fontSize: 22.sp, color: Colors.black)
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 4.r),
                              child: Image.asset('${Const.images}fcb.png', fit: BoxFit.cover,)),
                          AppText.larg(text: 'برشلونة'),
                          Container(
                            margin: EdgeInsets.only(top: 4.r),
                            width: 80.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: HexColor(AppColors.appMainColor),
                                borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('${Const.icons}icon_statdium.png'),
                                Container(margin: EdgeInsets.only(top: 4.r), child: AppText.medium(text: '4-3-3', color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsetsDirectional.only(top: 20, start: 10,end: 10),
                elevation: 8,
                color: HexColor(AppColors.tabColor),
                child: Container(
                  height: 68,
                  color: HexColor(AppColors.tabColor),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: Const.appFont),
                    unselectedLabelStyle: const TextStyle(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.w700,
                        fontFamily: Const.appFont),
                    indicatorColor: HexColor(AppColors.appMainColor),
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (int index) {
                      _controller.tabIndex = index;
                    },
                    tabs: [
                      Tab(
                        text: 'التفاصيل',
                      ),
                      Tab(
                        text: 'اللاعبين',
                      ),
                      Tab(
                        text: 'الإحصائيات',
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 8,
                  margin: const EdgeInsetsDirectional.only(start: 10,end: 10),
                  child: TabBarView(
                    children: [
                      MatchDetailsTab(),
                      PlayersTab(),
                      StatisticsTab()
                    ],
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}

class MatchDetailsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 40.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('${Const.icons}icon_championships_color.svg'),
              SizedBox(width: 10.w),
              AppText.medium(
                  text: 'إسم البطولة',
                  fontSize: 18.sp,
                  color: Colors.black,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('${Const.icons}icon_person.svg'),
              SizedBox(width: 10.w),
              AppText.medium(
                  text: 'إسم حكم',
                  fontSize: 18.sp,
                  color: Colors.black,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('${Const.icons}icon_stadium_color.png'),
              SizedBox(width: 10.w),
              AppText.medium(
                  text: 'إسم الملعب',
                  fontSize: 18.sp,
                  color: Colors.black,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('${Const.icons}icon_time.svg'),
              SizedBox(width: 10.w),
              AppText.medium(
                  text: '10:00 PM',
                  fontSize: 18.sp,
                  color: Colors.black,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('${Const.icons}icon_date.svg'),
              SizedBox(width: 10.w),
              AppText.medium(
                  text: '14/11/2022',
                  fontSize: 18.sp,
                  color: Colors.black,
                  textAlign: TextAlign.center),
            ],
          ),
        )
      ],
    );
  }
}

class PlayersTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Container(
                height: 50,
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: Const.appFont),
                  unselectedLabelStyle: const  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: Const.appFont),
                  indicatorColor: HexColor(AppColors.appMainColor),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (int index) {

                  },
                  tabs: [
                    Tab(
                      text: 'ارسنال',
                    ),
                    Tab(
                      text: 'برشلونة',
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 8,
                child: TabBarView(
                  children: [
                    ListView.separated(
                        itemCount: 24,
                        itemBuilder: (context, index) => buildPlayerTeamHomeItem(),
                        separatorBuilder: (context, index) =>  const Divider(color: Colors.grey)),
                    ListView.separated(
                        itemCount: 24,
                        itemBuilder: (context, index) => buildPlayerTeamAwayItem(),
                    separatorBuilder: (context, index) =>  const Divider(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  buildPlayerTeamHomeItem() => Container(
    margin: EdgeInsetsDirectional.only(start: 20.r),
    height: 80.h,
    child: InkWell(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: NetworkImage('${Const.defaultUser}')),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.larg(text: 'محمد صلاح'),
              AppText.medium(text: 'حارس مرمى')
            ],
          ),
        ],
      ),
      onTap: () => Get.toNamed(Routes.player),
    )
  );

  buildPlayerTeamAwayItem() => Container(
      margin: EdgeInsetsDirectional.only(start: 20.r),
      height: 80.h,
      child: InkWell(
        child: Row(
          children: [
            CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage('${Const.defaultUser}')),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.larg(text: 'ليونيل ميسي'),
                AppText.medium(text: 'مهاجم')
              ],
            ),
          ],
        ),
        onTap: () => Get.toNamed(Routes.player),
      )
  );
}

class StatisticsTab extends StatelessWidget {
  const StatisticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.r),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) => buildStatisticsItem(index)),
    );
  }

  buildStatisticsItem(int index) => Container(
    margin: EdgeInsetsDirectional.only(start: 14.r, end: 14.r, top: 40),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.larg(text: '65.6'),
            AppText.larg(text: 'الأهداف'),
            AppText.larg(text: '35.4'),
          ],
        ),
        Container(
            margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: 150,
                  percent: 0.4,
                  animation: true,
                  animationDuration: 1200,
                  isRTL: false,
                  lineHeight: 5,
                  progressColor: HexColor(AppColors.appMainColor),
                  barRadius: Radius.circular(20.r),
                ),
                LinearPercentIndicator(
                  width: 150,
                  percent: 0.6,
                  animation: true,
                  animationDuration: 1200,
                  isRTL: true,
                  lineHeight: 5,
                  progressColor: HexColor(AppColors.appMainColor),
                  barRadius: Radius.circular(20.r),
                )
              ],
            ))
      ],
    ),
  );
}