import 'package:amankoora/controller/team_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TeamScreen extends StatelessWidget {

  final TeamController _controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'فريق مسقط',
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
      body: GetBuilder<TeamController>(builder: (controller) => DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(top: 30.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 4.r),
                      child: Image.asset('${Const.images}afc.png', fit: BoxFit.cover,)),
                  AppText.larg(text: 'فريق ظفار'),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsetsDirectional.only(top: 30, start: 10,end: 10),
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
                  tabs: const [
                    Tab(
                      text: 'معلومات',
                    ),
                    Tab(
                      text: 'التشكيلة',
                    ),
                    Tab(
                      text: 'مباريات',
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
                    TeamInfoTab(),
                    TeamLineupTab(),
                    TeamMatchesTab()
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class TeamInfoTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: Container(
       margin: EdgeInsetsDirectional.only(top: 20.r, start: 10.r, end: 10.r, bottom: 20.r),
       child: Column(
         children: [
           Container(
             margin: EdgeInsetsDirectional.only(top: 20.r),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Row(

                   children: [
                     Image.asset('${Const.icons}icon_team_governorate.png'),
                     SizedBox(width: 4.w),
                     AppText.larg(text: 'المحافظة :'),
                   ],
                 ),
                 AppText.medium(text: 'محافظة الداخلية', fontSize: 18.sp),
               ],
             ),
           ),
           Container(
               margin: EdgeInsetsDirectional.only(top: 10.r, start: 10.r, end: 10.r),
               child: Divider(color: Colors.grey)),
           Container(
             margin: EdgeInsetsDirectional.only(top: 20.r),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Row(

                   children: [
                     Image.asset('${Const.icons}icon_team_state.png'),
                     SizedBox(width: 4.w),
                     AppText.larg(text: 'الولاية :'),
                   ],
                 ),
                 AppText.medium(text: 'ولاية نزوى', fontSize: 18.sp),
               ],
             ),
           ),
           Container(
               margin: EdgeInsetsDirectional.only(top: 10.r, start: 10.r, end: 10.r),
               child: Divider(color: Colors.grey)),
           Container(
             margin: EdgeInsetsDirectional.only(top: 20.r),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Row(

                   children: [
                     Image.asset('${Const.icons}icon_team_members.png'),
                     SizedBox(width: 4.w),
                     AppText.larg(text: 'عدد الأعضاء :'),
                   ],
                 ),
                 AppText.medium(text: '40', fontSize: 18.sp),
               ],
             ),
           ),
           Container(
               margin: EdgeInsetsDirectional.only(top: 10.r, start: 10.r, end: 10.r),
               child: Divider(color: Colors.grey)),
           Container(
             margin: EdgeInsetsDirectional.only(top: 20.r),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Image.asset('${Const.icons}icon_player_team.png'),
                     SizedBox(width: 4.w),
                     AppText.larg(text: 'نوع النشاط :'),
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     AppText.medium(text: 'كرة قدم', fontSize: 18.sp),
                     AppText.medium(text: 'كرة سلة', fontSize: 18.sp),
                     AppText.medium(text: 'كرة طائرة', fontSize: 18.sp),
                     AppText.medium(text: 'كرة تنس', fontSize: 18.sp),
                     AppText.medium(text: 'كرة قدم', fontSize: 18.sp),
                     AppText.medium(text: 'كرة سلة', fontSize: 18.sp),
                     AppText.medium(text: 'كرة طائرة', fontSize: 18.sp),
                     AppText.medium(text: 'كرة تنس', fontSize: 18.sp),
                   ],
                 )
               ],
             ),
           ),
           Container(
               margin: EdgeInsetsDirectional.only(top: 10.r, start: 10.r, end: 10.r),
               child: Divider(color: Colors.grey)),
         ],
       )
     ),
   );
  }
}

class TeamLineupTab extends StatelessWidget {

  final TeamController _controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(builder: (controller) => ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => ExpandableTheme(
            data: const ExpandableThemeData(useInkWell: true),
            child: Container(child: buildItem()))));
  }

  Widget buildItem() => ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          color: AppColors.lightWhite,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: Container(
                  color: HexColor(AppColors.appMainColor),
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      iconColor: Colors.white,
                      expandIcon: Icons.keyboard_arrow_up,
                      collapseIcon: Icons.keyboard_arrow_down,
                      iconSize: 30,
                    ),
                    header: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: HexColor(AppColors.appMainColor),
                      borderRadius: BorderRadius.circular(8.r)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText.medium(
                          color: Colors.white,
                            text: 'لاعبين خط الوسط'),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _controller.listPlayers.map((e) => buildPlayerItem()).toList(),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

  Widget buildPlayerItem() => Container(
    color: Colors.white,
      height: 80.h,
      child: InkWell(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 10.20, top: 10.r),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const NetworkImage('${Const.defaultUser}')),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.larg(text: 'محمد صلاح'),
                  AppText.medium(text: 'محافظة الداخلية, ولاية نزوى', color: AppColors.lightGray, fontSize: 12.sp)
                ],
              ),
            ],
          ),
        ),
        onTap: () => Get.toNamed(Routes.player),
      )
  );
}

class TeamMatchesTab extends StatelessWidget {

  final TeamController _controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(builder: (controller) => ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => ExpandableTheme(
            data: const ExpandableThemeData(useInkWell: true),
            child: Container(child: buildItem()))));
  }

  Widget buildItem() => ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          color: AppColors.lightWhite,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: Container(
                  color: HexColor(AppColors.appMainColor),
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      iconColor: Colors.white,
                      expandIcon: Icons.keyboard_arrow_up,
                      collapseIcon: Icons.keyboard_arrow_down,
                      iconSize: 30,
                    ),
                    header: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: HexColor(AppColors.appMainColor),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText.medium(
                            color: Colors.white,
                            text: 'بطولة عُمان الدولية'),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _controller.listMatches.map((e) => buildMatchesItem()).toList(),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

  Widget buildMatchesItem() => Container(
    width: double.infinity,
    height: 120,
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
