import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/screens/home/home_screen.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:halake_barber/service/staff_service.dart';

class LoginController extends BaseController {
  TextEditingController salonNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onTapContinue() async {
    if (salonNumberController.text.isEmpty) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseEnterSalonNumber,
        false,
      );
      return;
    }
    if (mobileNumberController.text.isEmpty) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseEnterMobileNumber,
        false,
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseEnterPassword,
        false,
      );
      return;
    }

    AppRes.showCustomLoader();
    StaffService()
        .logInStaff(
          salonNumber: salonNumberController.text,
          phone: mobileNumberController.text,
          password: passwordController.text,
        )
        .then((value) {
          print(value.message);
          if (value.status == true && value.data != null) {
            Get.back();
            Get.off(() => const HomeScreen());
          } else {
            Get.back();
            AppRes.showSnackBar(value.message ?? '', false);
          }
        });
  }
}
