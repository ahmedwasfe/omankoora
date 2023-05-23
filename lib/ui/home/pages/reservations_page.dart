
import 'package:amankoora/controller/reservations_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReservationsPage extends StatelessWidget{

  final ReservationsController _controller = Get.put(ReservationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ReservationsController>(builder: (controller) => DefaultTabController(
        length: 2,
        initialIndex: controller.tabIndex,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
              width: 250,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50).r,
                  color: const Color(0xffF8F6FB)
              ),
              child: ButtonsTabBar(
                onTap: (index) {
                  controller.tabIndex = index;
                  controller.update();
                },
                physics: const NeverScrollableScrollPhysics(),
                buttonMargin: const EdgeInsets.only(left: 10, top: 4, bottom: 4, right: 10),
                radius: 50,
                backgroundColor: HexColor(AppColors.appMainColor),
                unselectedBackgroundColor: const Color(0xffF8F6FB),
                unselectedLabelStyle: TextStyle(color: HexColor(AppColors.appMainColor),fontSize: 16.h,fontWeight: FontWeight.w400),
                labelStyle:
                TextStyle(color: Colors.white,fontSize: 16.h,fontWeight: FontWeight.w400),
                tabs: [
                  Tab(
                    icon: Container(
                        margin: const EdgeInsets.all(4),
                        alignment: AlignmentDirectional.center,
                        width: 80.w,
                        height: 50 .h,
                        child: AppText.medium(text: 'حجوزات', color: controller.tabIndex == 0 ? Colors.white : HexColor(AppColors.appMainColor), textAlign: TextAlign.center)),
                    text: "",
                  ),
                  Tab(
                    icon: Container(
                      width: 80.w,
                      height: 50 .h,
                      margin: const EdgeInsets.all(4),
                      child: AppText.medium(text: 'ملاعب', color: controller.tabIndex == 1 ? Colors.white : HexColor(AppColors.appMainColor), textAlign: TextAlign.center),),
                    text: "",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 8.r, right: 8.r),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 20,
                        itemBuilder: (context, index) => buildReservationsItem())
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.r, right: 8.r),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics:
                          const BouncingScrollPhysics(),
                          itemCount: 15,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 60,
                            mainAxisSpacing: 20,
                            childAspectRatio: 50 / 42,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => buildStadiumsItem())
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildReservationsItem() => Container(
    height: 120,
    margin: EdgeInsetsDirectional.only(top: 4.r, bottom: 4.r),
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 4.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppText.larg(text: 'إسم الملعب'),
            AppText.medium(text: 'المدينة, المنطقة', fontSize: 14.sp),
            Row(
              children: [
                AppText.medium(text: '11/11/2022 - 20/11/2022', fontSize: 12.sp),
                const Spacer(),
                AppText.medium(text: '10:00 AM - 10:00 PM', fontSize: 12.sp)
              ],
            )
          ],
        ),
      ),
    ),
  );

  Widget buildStadiumsItem() => Container(
    child: InkWell(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r)
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  )
              ),
              child: Image.asset('${Const.images}stadium_logo.png', fit: BoxFit.cover,),
            ),
            Container(
              width: double.infinity,
              height: 42.h,
              decoration: BoxDecoration(
                  color: HexColor(AppColors.appMainColor),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r)
                  )
              ),
              child: AppText.medium(text: 'أستاد السيب',
                  color: Colors.white,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      onTap: () => Get.toNamed(Routes.stadium),
    ),
  );


}
