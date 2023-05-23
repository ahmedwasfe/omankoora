import 'package:amankoora/controller/teams_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamsScreen extends StatelessWidget {

  final TeamsController _controller = Get.put(TeamsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: HexColor(AppColors.appMainColor),
          elevation: 0,
          title: AppText.larg(
              text: 'نادي برشلونة',
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
        body: Column(
          children: [
            SizedBox(height: 20.h),
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
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 28,
                  itemBuilder: (context, index) => buildTeamsItem()),
            ),
          ],
        ));
  }

  buildTeamsItem() => Container(
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
                Image.asset('${Const.images}team_logo.png'),
                SizedBox(width: 10.w),
                AppText.medium(text: 'فريق مسقط'),
              ],
            ),
          )),
      onTap: () => Get.toNamed(Routes.team),
    ),
  );
}
