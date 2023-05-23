import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsetsDirectional.only(end: 12.r, top: 50.r, start: 12.r),
        child: GridView.builder(
            shrinkWrap: true,
            physics:
            const BouncingScrollPhysics(),
            itemCount: 8,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 50,
              mainAxisSpacing: 25,
              childAspectRatio: 88 / 88,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => buildActivitesItem()),
      ),
    );
  }

  Widget buildActivitesItem() => Container(
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30.r),
            child: Align(
                child: Image.asset('${Const.images}activites_logo.png')),
          ),
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              color: HexColor(AppColors.appMainColor),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r)
              )
            ),
            child: AppText.medium(text: 'كرة قدم',
            color: Colors.white,
            textAlign: TextAlign.center),
          )
        ],
      ),
    ),
  );
}
