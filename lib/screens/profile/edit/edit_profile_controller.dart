import 'dart:io';

import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/service/staff_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends BaseController {
  BarberData? barberData;
  var isMale = 0.obs;
  File? imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() async {
    SharePref sharePref = await SharePref().init();
    barberData = sharePref.getBarberUser()?.data;
    nameController.text = barberData?.name ?? "";
    mobileNumberController.text = barberData?.phone ?? "";
    passwordController.text = barberData?.password ?? "";
    isMale.value = barberData?.gender?.toInt() ?? 1;
    update();
  }

  void onTapImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
      update();
    }
  }

  void onTapGender(int position) {
    isMale.value = position;
  }

  void onTapUpdate() async {
    if (barberData?.phone == '03447950912') {
      AppRes.showSnackBar('You are a tester,You can\'t update profile', false);
      return;
    }
    if ((barberData?.photo == null || barberData?.photo?.isEmpty == true) &&
        imageFile == null) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseSelectImage,
        false,
      );
      return;
    }
    if (nameController.text.isEmpty) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseEnterName,
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
    await StaffService().editStaff(
      salonId: barberData?.salonId?.toInt(),
      staffId: barberData?.id?.toInt(),
      name: nameController.text,
      phone: mobileNumberController.text,
      password: passwordController.text,
      gender: isMale.value,
      staffProfileImage: imageFile,
    );
    AppRes.hideCustomLoaderWithBack();
  }
}
