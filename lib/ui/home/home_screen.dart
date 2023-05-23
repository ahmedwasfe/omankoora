import 'package:amankoora/controller/home_controller.dart';
import 'package:amankoora/model/drawer.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/ui/home/pages/activites_page.dart';
import 'package:amankoora/ui/home/pages/championships_page.dart';
import 'package:amankoora/ui/home/pages/news_page.dart';
import 'package:amankoora/ui/home/pages/reservations_page.dart';
import 'package:amankoora/ui/home/pages/settings_page.dart';
import 'package:amankoora/ui/home/pages/clubs_page.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_helper.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';
import 'pages/statistics_page.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        key: _controller.scaffoldKey,
        appBar: AppBar(
          backgroundColor: HexColor(AppColors.appMainColor),
          toolbarHeight: 80.h,
          title: AppText.larg(
              text: _controller.listDrawers[_controller.drawerIndex].title,
              color: Colors.white,
              textAlign: TextAlign.center),
          centerTitle: true,
          actions: [
            _controller.drawerIndex == 6
                ? IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if(AppHelper.getCurrentUserToken() == null){
                    Get.toNamed(Routes.login);
                  }else{
                    Get.toNamed(Routes.addReservation);
                  }
                })
                : Container()
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _controller.drawerIndex,
            children: [
              HomePage(),
              ChampionshipsPage(),
              ClubsPage(),
              StatisticsPage(),
              ActivitesPage(),
              NewsPage(),
              ReservationsPage(),
              SettingsPage(),
            ],
          ),
        ),
        drawer: Container(
          margin: EdgeInsetsDirectional.only(top: 20.r),
          height: double.infinity,
          width: 280,
          decoration: BoxDecoration(
              color: HexColor(AppColors.appMainColor),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 30.r, end: 20.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://i.postimg.cc/zBqXvBYt/test-logo.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.r),
                    AppText.larg(
                        text: 'عمان كوورة',
                        color: Colors.white,
                        fontSize: 18.sp)
                  ],
                ),
              ),
              SizedBox(height: 50.r),
              Expanded(
                child: Align(
                  child: ListView.builder(
                      itemCount: _controller.listDrawers.length,
                      itemBuilder: (context, index) {
                        // _controller.drawerIndex = index;
                        return buildDrawerItem(
                            _controller.listDrawers[index], index);
                      }),
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 10).r,
                  margin: EdgeInsets.only(
                      right: 20.r, top: 8.r, bottom: 50.r, left: 20.r),
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.larg(
                          text: AppHelper.getCurrentUserToken == null ? 'تسجيل خروج' : 'تسجيل دخول',
                          fontSize: 16.sp,
                          color: HexColor(AppColors.appMainColor),
                          textAlign: TextAlign.center),
                      SizedBox(width: 14.w),
                      AppHelper.getCurrentUserToken == null ? SvgPicture.asset('${Const.icons}icon_logout.svg') : Container()
                    ],
                  ),
                ),
                onTap: () => Get.toNamed(Routes.login),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildDrawerItem(DrawerItem item, int index) => GetBuilder<HomeController>(builder: (controller) => InkWell(
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 20),
      margin: EdgeInsets.only(right: 20.r, top: 8.r, bottom: 4.8),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          color: controller.drawerIndex == index ? Colors.white : HexColor(AppColors.appMainColor),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(controller.drawerIndex == index ? '${Const.icons}${item.iconColor}' : '${Const.icons}${item.iconWhite}'),
          SizedBox(width: 24.w),
          AppText.larg(
              text: '${item.title}',
              color: controller.drawerIndex == index ? HexColor(AppColors.appMainColor) : Colors.white,
              textAlign: TextAlign.center),
        ],
      ),
    ),
    onTap: () async {
      if (controller.scaffoldKey.currentState!.isDrawerOpen) {
        controller.scaffoldKey.currentState!.closeDrawer();
        controller.getCurrenDrawerIndex(drawerIndex: index);
        controller.update();
      }
    },
  ));
}
