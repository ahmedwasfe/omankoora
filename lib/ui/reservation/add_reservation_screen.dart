import 'package:amankoora/controller/add_reservations_controller.dart';
import 'package:amankoora/model/government.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_helper.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddReservationScreen extends StatelessWidget {

  final AddReservationsController _controller = Get.put(AddReservationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'إضافة حجز',
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
      body: Form(
        key: _controller.formKey,
        child: GetBuilder<AddReservationsController>(builder: (controller) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(top: 50.r, start: 10.r, end: 10.r, bottom: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'الإسم'),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r, end: 10.r),
                      height: 50,
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.usernameController,
                        keyboardType: TextInputType.text,
                        cursorColor: HexColor(AppColors.appMainColor),
                        cursorWidth: 1.3.w,
                        cursorRadius: const Radius.circular(12).r,
                        enabled: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: Const.appFont,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'إسم الشخص',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400
                            ),
                            fillColor: Color(0xffFFFFFF),
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.lightGray, width: 1.w),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 343.h,
                              minWidth: 48.w,
                            )),
                        validator: (username){
                          AppHelper.showToast(message: AppHelper.validateName(name: username!)!, color: HexColor(AppColors.appMainColor));
                        } ,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r, end: 10.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'رقم الجوال'),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r, end: 10.r),
                      height: 50,
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.userphoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: HexColor(AppColors.appMainColor),
                        cursorWidth: 1.3.w,
                        cursorRadius: const Radius.circular(12).r,
                        enabled: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: Const.appFont,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'رقم جوال الشخص',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400
                            ),
                            fillColor: Color(0xffFFFFFF),
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.lightGray, width: 1.w),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 343.h,
                              minWidth: 48.w,
                            )),
                        validator: (phone) {
                          AppHelper.showToast(message: AppHelper.validatePhone(phone: phone!)!, color: HexColor(AppColors.appMainColor));
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'إختر المحافظة'),
                    ),
                    ExpandableTheme(
                        data: const ExpandableThemeData(useInkWell: true),
                        child: Container(child: buildGovernmentsItem())),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'إختر المنطقة'),
                    ),
                    ExpandableTheme(
                        data: const ExpandableThemeData(useInkWell: true),
                        child: Container(child: buildAreasItem())),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'إختر الملعب'),
                    ),
                    ExpandableTheme(
                        data: const ExpandableThemeData(useInkWell: true),
                        child: Container(child: buildStadiumsItem())),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r, end: 10.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'حدد وقت الحجز'),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, top: 16.r, end: 4.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText.medium(text: 'من'),
                                SizedBox(width: 10.w),
                                InkWell(
                                  child: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    padding: EdgeInsetsDirectional.only(start: 8.r),
                                    width: 130.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(width: 1.r, color: AppColors.lightGray)
                                    ),
                                    child: Row(
                                      children: [
                                        Obx(() => AppText.medium(text: _controller.timeFrom.value.isNotEmpty ? _controller.timeFrom.value : AppHelper.getCurrentTime(context),textAlign: TextAlign.center, textDirection: TextDirection.ltr)),
                                        const Spacer(),
                                        Container(
                                            height: 36.h,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                              color: HexColor(AppColors.appMainColor),
                                              borderRadius: BorderRadius.circular(8.r),
                                            ),
                                            child: const Icon(Icons.access_time_rounded, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  onTap: () => _controller.showTimeDialog(context, isFrom: true),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText.medium(text: 'إلى'),
                                SizedBox(width: 10.w),
                                InkWell(
                                  child: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    padding: EdgeInsetsDirectional.only(start: 8.r),
                                    width: 130.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(width: 1.r, color: AppColors.lightGray)
                                    ),
                                    child: Row(
                                      children: [
                                        Obx(() => AppText.medium(text: _controller.timeTo.value.isNotEmpty ? _controller.timeTo.value : AppHelper.getCurrentTime(context),textAlign: TextAlign.center, textDirection: TextDirection.ltr)),
                                        const Spacer(),
                                        Container(
                                            height: 36.h,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                              color: HexColor(AppColors.appMainColor),
                                              borderRadius: BorderRadius.circular(8.r),
                                            ),
                                            child: const Icon(Icons.access_time_rounded, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  onTap: () => _controller.showTimeDialog(context, isFrom: false),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 20.r, end: 10.r),
                      child: AppText.larg(
                          color: Colors.black,
                          fontSize: 16.sp,
                          text: 'حدد تاريخ الحجز'),
                    ),
                    Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, top: 16.r, end: 4.r),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(text: 'من'),
                                  SizedBox(width: 10.w),
                                  InkWell(
                                    child: Container(
                                      alignment: AlignmentDirectional.centerStart,
                                      padding: EdgeInsetsDirectional.only(start: 8.r),
                                      width: 130.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(width: 1.r, color: AppColors.lightGray)
                                      ),
                                      child: Row(
                                        children: [
                                          Obx(() => AppText.medium(text: _controller.dateFrom.value.isNotEmpty ? _controller.dateFrom.value : AppHelper.getDateTody(),textAlign: TextAlign.center, textDirection: TextDirection.ltr)),
                                          Spacer(),
                                          Container(
                                              height: 36.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                color: HexColor(AppColors.appMainColor),
                                                borderRadius: BorderRadius.circular(8.r),
                                              ),
                                              child: const Icon(Icons.date_range_rounded, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    onTap: () => _controller.showDateDialog(context, isFrom: true),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(text: 'إلى'),
                                  SizedBox(width: 10.w),
                                  InkWell(
                                    child: Container(
                                      alignment: AlignmentDirectional.centerStart,
                                      padding: EdgeInsetsDirectional.only(start: 8.r),
                                      width: 130.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(width: 1.r, color: AppColors.lightGray)
                                      ),
                                      child: Row(
                                        children: [
                                          Obx(() => AppText.medium(text: _controller.dateTo.value.isNotEmpty ? _controller.dateTo.value : AppHelper.getDateTody(),textAlign: TextAlign.center, textDirection: TextDirection.ltr)),
                                          Spacer(),
                                          Container(
                                              height: 36.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                color: HexColor(AppColors.appMainColor),
                                                borderRadius: BorderRadius.circular(8.r),
                                              ),
                                              child: const Icon(Icons.date_range_rounded, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    onTap: () => _controller.showDateDialog(context, isFrom: false),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildGovernmentsItem() => ExpandableNotifier(
      child: GetBuilder<AddReservationsController>(builder: (controller) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 8,
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
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() => AppText.medium(
                            color: Colors.black,
                            fontSize: 16.sp,
                            text: controller.governmentSelected.value.isNotEmpty ? controller.governmentSelected.value : 'إختر المحافظة')),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _controller.listGovernments.map((government) => Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsetsDirectional.only(top: 10.r, start: 28.r, end: 8.r, bottom: 20.r),
                                child: Row(
                                  children: [
                                    AppText.medium(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        text: government.name!),
                                    Spacer(),
                                    government.isSelect! ? Icon(Icons.check_circle_outline_rounded, color: HexColor(AppColors.appMainColor)): Container()
                                  ],
                                )),
                            onTap: () {
                              for(Government gover in controller.listGovernments){
                                gover.isSelect = false;
                              }
                              controller.governmentSelected.value = government.name!;
                              government.isSelect = true;
                              controller.update();
                              print('Government: ${government.name}');
                            },
                          ))).toList(),
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
      )));

  Widget buildAreasItem() => ExpandableNotifier(
      child: GetBuilder<AddReservationsController>(builder: (controller) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 8,
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
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() => AppText.medium(
                            color: Colors.black,
                            fontSize: 16.sp,
                            text: controller.areaSelected.value.isNotEmpty ? controller.areaSelected.value  : 'إسم المنطقة')),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _controller.listAreas.map((area) => Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsetsDirectional.only(top: 10.r, start: 28.r, end: 8.r, bottom: 20.r),
                                child: Row(
                                  children: [
                                    AppText.medium(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        text: area.name!),
                                    const Spacer(),
                                    area.isSelect! ? Icon(Icons.check_circle_outline_rounded, color: HexColor(AppColors.appMainColor)): Container()
                                  ],
                                )),
                            onTap: () {
                              for(Government gove in controller.listAreas){
                                gove.isSelect = false;
                              }
                              controller.areaSelected.value = area.name!;
                              area.isSelect = true;
                              controller.update();
                              print('Government: ${area.name}');
                            },
                          ))).toList(),
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
      )));

  Widget buildStadiumsItem() => ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 8,
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
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText.medium(
                            color: Colors.black,
                            fontSize: 16.sp,
                            text: 'إسم الملعب'),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _controller.listGovernments.map((e) => Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Container(
                              margin: EdgeInsetsDirectional.only(top: 10.r, start: 8.r, end: 8.r),
                              child: AppText.medium(text: 'المحافظة')))).toList(),
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
}
