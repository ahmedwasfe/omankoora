import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);

  final int x;
  final double y;
  final double y1;
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class StatisticsPage extends StatelessWidget {

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  final List<ChartData> chartData = <ChartData>[
    ChartData(2010, 10.53, 5.3),
    ChartData(2011, 9.5, 5.4),
    ChartData(2012, 10, 2.65),
    ChartData(2013, 9.4, 2.62),
    ChartData(2014, 5.8, 10.99),
    ChartData(2015, 4.9, 1.44),
    ChartData(2016, 4.5, 2),
    ChartData(2017, 3.6, 1.56),
    ChartData(2018, 3.43, 5.1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 180,
              margin: EdgeInsetsDirectional.only(end: 12.r, top: 6.r, bottom: 6.r, start: 12.r),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppText.larg(text: 'عدد الفرق'),
                            AppText.larg(text: '100', fontSize: 30.sp),
                            AppText.medium(text: 'فريق', color: AppColors.lightGray),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(top: 16.r),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 26.r),
                              child: Row(
                                children: [
                                  AppText.medium(text: 'زيادة بنسبة', fontSize: 12.sp, color: AppColors.lightGray),
                                  SizedBox(width: 6.w),
                                  AppText.medium(text: '53%', fontSize: 12.sp, color: HexColor(AppColors.appSubColor)),
                                  Icon(Icons.keyboard_arrow_up_rounded, size: 30, color: HexColor(AppColors.appSubColor),)


                                ],
                              ),
                            ),
                            Container(
                              height: 120,
                              width: 150,
                              child: SfCartesianChart(
                                series: <ChartSeries>[
                                  SplineAreaSeries<ChartData, int>(
                                    color: HexColor(AppColors.appMainColor),
                                    xValueMapper: (ChartData cData, _) => cData.x,
                                    yValueMapper: (ChartData cData, _) => cData.y,
                                    dataSource: chartData,
                                  ),
                                ],
                              ),

                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(end: 12.r, top: 6.r, bottom: 6.r, start: 12.r),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 13,
                    childAspectRatio: 88 / 160,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => buildStatisticsItem(index)),
            ),
          ],
        ),
      ));
  }

  Widget buildStatisticsItem(int index) => Container(
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppText.larg(text: index % 2 == 1 ? 'عدد لاعبين كرة القدم' : 'عدد اللاعبين', maxline: 2, textAlign: TextAlign.center),
            AppText.larg(text: '100', fontSize: 30.sp),
            Container(
              margin: EdgeInsetsDirectional.only(start: 26.r),
              child: Row(
                children: [
                  AppText.medium(text: index % 2 == 0 ? 'زيادة بنسبة' : 'إنخفاض بنسبة', fontSize: 12.sp, color: AppColors.lightGray),
                  SizedBox(width: 4.w),
                  AppText.medium(text: '53%', fontSize: 12.sp, color: index % 2 == 0 ? HexColor(AppColors.appSubColor) : AppColors.lightRed),
                  SizedBox(width: 4.w),
                  Icon(index % 2 == 0 ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, size: 30, color: index % 2 == 0 ? HexColor(AppColors.appSubColor) : AppColors.lightRed)
                ],
              ),
            ),
            Container(
              height: 120,
              width: 150,
              child: SfCartesianChart(
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, int>(
                    color: HexColor(AppColors.appMainColor),
                    xValueMapper: (ChartData cData, _) => cData.x,
                    yValueMapper: (ChartData cData, _) => cData.y,
                    dataSource: chartData,
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    ),
  );
}
