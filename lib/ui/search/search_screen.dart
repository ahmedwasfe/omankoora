import 'package:amankoora/controller/search_controller.dart';
import 'package:amankoora/model/search/search_type.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {

  final SearchController _controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'البحث',
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
      body: GetBuilder<SearchController>(builder: (controller) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsetsDirectional.only(
                    top: 16.r, start: 16.r, end: 16.r),
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
                      enabled: true,
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
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r, start: 20.r),
              child: Row(
                children: controller.listSearchType.map((type) => InkWell(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(end: 20.r),
                    width: 100.w,
                    height: 34.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: type.isSelect! ? HexColor(AppColors.appMainColor) : HexColor(AppColors.formSearchColor),
                      borderRadius: BorderRadius.circular(20.r)),
                    child: AppText.medium(text: type.name!, color: type.isSelect! ? Colors.white : Colors.black),
                  ),
                  onTap: (){
                    for(SearchType searchType in controller.listSearchType){
                      searchType.isSelect = false;
                    }

                    type.isSelect = true;
                    controller.update();
                  },
                )).toList(),
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r, end: 16.r),
              color: HexColor(AppColors.formSearchColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildSearchItem(index)),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20.r, bottom: 20.r),
                    child: AppWidgets.CustomButton(
                        text: 'حفظ',
                        width: 140.w,
                        radius: 50.r,
                        click: (){}),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  buildSearchItem(int index) => Container(
    margin: EdgeInsetsDirectional.only(top: 6.r, start: 8.r, bottom: 6.r),
    width: double.infinity,
    child: Row(
      children: [
        Obx(() => Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)
            ),
            checkColor: Colors.white,
            value: _controller.itemSelect.value,
            onChanged: (value){
              _controller.itemSelect.value = value!;
            })),
        Expanded(child: AppText.medium(text: 'نادي السيب')),
      ],
    ),
  );
}
