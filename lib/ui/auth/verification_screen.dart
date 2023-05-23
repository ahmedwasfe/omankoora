import 'package:amankoora/controller/login_controller.dart';
import 'package:amankoora/routes/routes.dart';
import 'package:amankoora/utils/app_color.dart';
import 'package:amankoora/utils/app_text.dart';
import 'package:amankoora/utils/components.dart';
import 'package:amankoora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget  {

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with TickerProviderStateMixin{
  final LoginController _controller = Get.put(LoginController());
  late AnimationController _animationController;
  final focusNode = FocusNode();

  @override
  void initState() {

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 120));
    super.initState();
  }

  String get timeRemaing {
    Duration count =
        _animationController.duration! * _animationController.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(builder: (controller) => Form(
        key: _controller.verificationformKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 120.r),
                        width: 120.w, height: 120.h,
                        child:  Image.network('https://i.postimg.cc/zBqXvBYt/test-logo.png', fit: BoxFit.contain, color: HexColor(AppColors.appMainColor))),
                    SizedBox(height: 10.r),
                    AppText.larg(text: 'كود التفعيل', fontSize: 20.sp),
                    AppText.medium(text: 'تحقق من حسابك عن طريق إدخال الرمز المكون \n4 أرقام الذي أرسلناه إلى:  ${controller.phoneController.text}')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.r),
                child: SizedBox(
                  height: 100.h,
                  width: 50.sw,
                  child: Pinput(
                    controller: controller.pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    validator: (value) {
                      return value == '2222' ? null : 'Pin is incorrect';
                    },
                    // onClipboardFound: (value) {
                    //   debugPrint('onClipboardFound: $value');
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: AppText.medium(text: 'إعادة إرسال الرمز'.tr),
                      onPressed: () {

                      }),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Container(
                      margin: EdgeInsets.only(top: 8.r),
                      child: AppText.larg(text:
                        timeRemaing,
                          fontSize: 14,
                          color: HexColor(AppColors.appMainColor),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsetsDirectional.all(30.r),
                  child: AppWidgets.CustomButton(
                      height: 60.h,
                      text: 'تأكيد',
                      radius: 28.r,
                      click: () => Get.toNamed(Routes.addReservation))),
              Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r, start: 30.r, end: 30.r),
                  child: AppWidgets.CustomButton(
                      height: 60.h,
                      text: 'إعادة إرسال',
                      textColor: HexColor(AppColors.appMainColor),
                      containerBackground: Colors.white,
                      borderColor: HexColor(AppColors.appMainColor),
                      borderWidth: 1,
                      radius: 28.r,
                      click: () {
                        if (_animationController.isAnimating)
                          _animationController.stop();
                        else {
                          _animationController.reverse(
                              from: _animationController.value == 0
                                  ? 1.0
                                  : _animationController.value);
                        }
                      })),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Obx(() => controller.isLoading == true ? AppWidgets.CustomProgress() : Container())),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
