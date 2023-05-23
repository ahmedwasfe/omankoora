import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppText {

  static Widget larg(
      {required String text,
      Color? color = AppColors.lightBlack,
      double? fontSize = 18,
      FontWeight fontWeight = FontWeight.w700,
      TextAlign? textAlign,
        int? maxline}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: fontSize?.sp,
          fontWeight: fontWeight,
          color: color),
    );
  }

  static Widget medium(
      {required String text,
      Color? color = Colors.black,
      double fontSize = 16,
      double? height,
      FontWeight fontWeight = FontWeight.w400,
      TextAlign? textAlign,
        TextDirection? textDirection,
      int? maxline}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      textDirection: textDirection,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight),
    );
  }

}
