import 'package:amankoora/model/government.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddReservationsController extends GetxController{

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  RxString governmentSelected = ''.obs;
  RxString areaSelected = ''.obs;
  RxString timeFrom = ''.obs;
  RxString timeTo = ''.obs;
  RxString dateFrom = ''.obs;
  RxString dateTo = ''.obs;

  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;
  late TextEditingController userphoneController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    userphoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    usernameController.dispose();
    userphoneController.dispose();
    super.dispose();
  }

  List<Government> listGovernments = [
    Government(name: 'مسندم', isSelect: false),
    Government(name: 'البريمي', isSelect: false),
    Government(name: 'شمال الباطنة', isSelect: false),
    Government(name: 'جنوب الباطنة', isSelect: false),
    Government(name: 'مسقط', isSelect: false),
    Government(name: 'الداخلية', isSelect: true),
    Government(name: 'شمال الشرقية', isSelect: false),
    Government(name: 'شمال الشرقية', isSelect: false),
    Government(name: 'الوسطى', isSelect: false),
    Government(name: 'ظفار', isSelect: false),
  ];

  List<Government> listAreas = [
    Government(name: 'مدحاء', isSelect: true),
    Government(name: 'السنينة', isSelect: false),
    Government(name: 'السويق', isSelect: false),
    Government(name: 'المصنعة', isSelect: false),
    Government(name: 'السيب', isSelect: false),
    Government(name: 'ضنك', isSelect: false),
    Government(name: 'جعلان بني بوحسن', isSelect:  false),
    Government(name: 'دما والطايين', isSelect: false),
    Government(name: 'جعلان بني بوحسن', isSelect: false),
    Government(name: 'المزيونة', isSelect: false),
  ];

  void showTimeDialog(BuildContext context, {required isFrom}) async {
    TimeOfDay? newTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.now());
    if (newTime == null) return;
    time = newTime;
    int hour = time.hour;
    int minute = time.minute;

    print('TIME: $hour:$minute:${time.format(context)}');

    if(isFrom) {
      timeFrom.value = time.format(context);
    } else {
      timeTo.value = time.format(context);
    }
  }
  
  void showDateDialog(BuildContext context, {required isFrom}) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) return;
    date = newDate;
    int year = date.year;
    int month = date.month;
    int day = date.day;
    if(isFrom) {
      dateFrom.value = '$year-$month-$day';
    } else {
      dateTo.value = '$year-$month-$day';
    }
  }

}