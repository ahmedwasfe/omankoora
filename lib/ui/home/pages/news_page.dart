import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 20.r),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 18,
            itemBuilder: (context, index) => buildNewsItem()),
      ),
    );
  }

  Widget buildNewsItem() => InkWell(
    child: Container(
      height: 150,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, bottom: 8.r, top: 8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Image.network(
              Const.defaultSlider,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.black38,
          ),
          Container(
            width: double.infinity,
            height: 150,
            alignment: Alignment.bottomRight,
            margin: EdgeInsetsDirectional.only(start: 14.r, bottom: 20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: AppText.larg(text: 'عنوان الخبر',
                      color: Colors.white),
                ),
                Container(
                  child: AppText.medium(text: 'نص افتراضي لتفاصيل الخبر الذي سوف يعرض هنا',
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    ),
    onTap: () => Get.toNamed(Routes.newsDetails),
  );
}
