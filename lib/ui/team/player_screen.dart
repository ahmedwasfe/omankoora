import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.larg(
            text: 'اللاعب',
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                Const.defaultPLayer,
                fit: BoxFit.cover,
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(top: 20.r, start: 10.r, end: 10.r, bottom: 20.r),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(

                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'إسم اللاعب :'),
                          ],
                        ),
                        AppText.medium(text: 'محمد صلاح', fontSize: 18.sp),
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
                            SvgPicture.asset('${Const.icons}icon_player_id.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'الرقم المدني :'),
                          ],
                        ),
                        AppText.medium(text: '123456789', fontSize: 18.sp),
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
                            SvgPicture.asset('${Const.icons}icon_player_age.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'عمر اللاعب :'),
                          ],
                        ),
                        AppText.medium(text: '27', fontSize: 18.sp),
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
                            SvgPicture.asset('${Const.icons}icon_player_birthdate.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'تاريخ الميلاد :'),
                          ],
                        ),
                        AppText.medium(text: '16/11/2022', fontSize: 18.sp),
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
                            Image.asset('${Const.icons}icon_player_team.png'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'الفريق :'),
                          ],
                        ),
                        AppText.medium(text: 'برشلونة', fontSize: 18.sp),
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
                            SvgPicture.asset('${Const.icons}icon_player_activity.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'النشاط :'),
                          ],
                        ),
                        AppText.medium(text: 'كرة قدم', fontSize: 18.sp),
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
                            Image.asset('${Const.icons}icon_player_team.png'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'المركز :'),
                          ],
                        ),
                        AppText.medium(text: 'مهاجم', fontSize: 18.sp),
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
                            SvgPicture.asset('${Const.icons}icon_player_weight.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'الطول :'),
                          ],
                        ),
                        AppText.medium(text: '185 cm', fontSize: 18.sp),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 10.r, start: 10.r, end: 10.r),
                      child: Divider(color: Colors.grey)),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20.r, bottom: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_player_weight.svg'),
                            SizedBox(width: 4.w),
                            AppText.larg(text: 'الوزن :'),
                          ],
                        ),
                        AppText.medium(text: '75 kg', fontSize: 18.sp),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
