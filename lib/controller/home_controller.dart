import 'package:amankoora/model/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late GlobalKey<ScaffoldState> scaffoldKey;
  int drawerIndex = 0;

  List<DrawerItem> listDrawers = [
    DrawerItem('icon_home_color.svg', 'icon_home_white.svg', 'الرئيسية'),
    DrawerItem('icon_championships_color.svg', 'icon_championships_white.svg',
        'البطولات'),
    DrawerItem('icon_teams_color.svg', 'icon_teams_white.svg', 'الأندية'),
    DrawerItem(
        'icon_statistics_color.svg', 'icon_statistics_white.svg', 'الإحصائيات'),
    DrawerItem(
        'icon_activites_color.svg', 'icon_activites_white.svg', 'الأنشطة'),
    DrawerItem('icon_news_color.svg', 'icon_news_white.svg', 'الأخبار'),
    DrawerItem('icon_reservations_color.svg', 'icon_reservations_white.svg',
        'الحجوزات'),
    DrawerItem(
        'icon_settings_color.svg', 'icon_settings_white.svg', 'الإعدادات'),
  ];

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.onInit();
  }

  void getCurrenDrawerIndex({required int drawerIndex}) {
    this.drawerIndex = drawerIndex;
    update();
  }
}
