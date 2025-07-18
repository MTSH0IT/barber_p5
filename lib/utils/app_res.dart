import 'dart:math';

import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_dialog.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppRes {
  static const String isLogin = 'is_login';
  static double latitude = -1;
  static double longitude = -1;
  static const String user = 'user';
  static const String settings = 'settings';
  static const String topicName = 'users';
  static const String ct = 'ct';

  static String commonDateFormat = 'yyyy-MM-ddThh:mm:ssZ';
  static int limitOfSlots = 40;
  static String currency = '';
  static int totalDays = 90;

  static Future<SnackbarController> showSnackBar(
    String msg,
    bool positive,
  ) async {
    return Get.showSnackbar(
      GetSnackBar(
        titleText: Container(),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        borderRadius: 15,
        backgroundColor: positive ? ColorRes.white : ColorRes.bitterSweet1,
        message: msg,
        boxShadows: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        messageText: Text(
          msg,
          style: kSemiBoldThemeTextStyle.copyWith(
            color: positive ? ColorRes.themeColor : ColorRes.bitterSweet,
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<void> showCustomLoader() async {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CustomLoader(),
        );
      },
      barrierDismissible: false,
    );
  }

  static Future<void> hideCustomLoader() async {
    Get.back();
  }

  static Future<void> hideCustomLoaderWithBack() async {
    Get.back();
    Get.back();
  }

  // static bool isSalonIsOpen(SalonData? salon) {
  //   int currentDay = DateTime.now().weekday;
  //   int todayTime = int.parse('${DateTime.now().hour}${DateTime.now().minute}');
  //   if (salon?.satSunFrom == null ||
  //       salon?.satSunTo == null ||
  //       salon?.monFriFrom == null ||
  //       salon?.monFriTo == null) {
  //     return false;
  //   }
  //   if (currentDay > 5) {
  //     return int.parse('${salon?.satSunFrom}') < todayTime &&
  //         int.parse('${salon?.satSunTo}') > todayTime;
  //   } else {
  //     return int.parse('${salon?.monFriFrom}') < todayTime &&
  //         int.parse('${salon?.monFriTo}') > todayTime;
  //   }
  // }

  static bool isAvailableForAdd(
    String from,
    String to,
    TimeOfDay selectedTime,
  ) {
    int fromTime = int.parse(
      '${getHourFromTime(from)}${int.parse(getMinFromTime(to)) < 10 && int.parse(getMinFromTime(to)) > 0 ? '0${getMinFromTime(from)}' : getMinFromTime(from)}',
    );
    int toTime = int.parse(
      '${getHourFromTime(to)}${int.parse(getMinFromTime(to)) < 10 && int.parse(getMinFromTime(to)) > 0 ? '0${getMinFromTime(to)}' : getMinFromTime(to)}',
    );
    int todayTime = int.parse(
      '${selectedTime.hour}${selectedTime.minute < 10 ? '0${selectedTime.minute}' : selectedTime.minute}',
    );
    if (kDebugMode) {
      print('$fromTime $toTime $todayTime');
    }
    return fromTime <= todayTime && toTime >= todayTime;
  }

  static double calculateDistance(double lat1, double lon1) {
    var p = 0.017453292519943295;
    var c = cos;

    var a =
        0.5 -
        c((AppRes.latitude - lat1) * p) / 2 +
        c(lat1 * p) *
            c(AppRes.latitude * p) *
            (1 - c((AppRes.longitude - lon1) * p)) /
            2;
    return (12742 * asin(sqrt(a))).toPrecision(2);
  }

  static String getGenderTypeInStringFromNumber(
    BuildContext context,
    int genderType,
  ) {
    return genderType == 1
        ? AppLocalizations.of(context)!.male.toUpperCase()
        : genderType == 0
        ? AppLocalizations.of(Get.context!)!.female.toUpperCase()
        : AppLocalizations.of(Get.context!)!.unisex.toUpperCase();
  }

  static String getAddressTypeInStringFromNumber(int genderType) {
    return genderType == 0
        ? AppLocalizations.of(Get.context!)!.home
        : AppLocalizations.of(Get.context!)!.office;
  }

  static String convert24HoursInto12Hours(String? value) {
    DateTime dateTime = DateTime(
      DateTime.now().year,
      1,
      1,
      int.parse(value?.substring(0, 2) ?? '0'),
      (value?.length ?? 0) <= 4
          ? int.parse(value?.substring(2, 4) ?? '0')
          : int.parse(value?.substring(3, 5) ?? '0'),
    );
    return DateFormat('hh:mm a').format(dateTime);
  }

  ///------------------------ Image quality ------------------------///
  static const int imageQuality = 40;
  static const double maxWidth = 720;
  static const double maxHeight = 720;

  static String formatDate(
    DateTime dateTime, {
    String pattern = 'dd MMM, yyyy - EEE - h:mm a',
    bool isUtc = true,
  }) {
    return DateFormat(pattern).format(isUtc ? dateTime.toLocal() : dateTime);
  }

  static DateTime parseDate(
    String dateTime, {
    String pattern = 'yyyy-MM-ddThh:mm:ssZ',
    bool isUtc = true,
  }) {
    return DateFormat(pattern).parse(dateTime, isUtc);
  }

  static int getHourFromTime(String? time) {
    if (time == null) return 0;
    return int.parse(time.split(":")[0]) +
        (time.split(":")[1].split(" ")[1].contains("PM") &&
                int.parse(time.split(":")[0]) != 12
            ? 12
            : 0);
  }

  static String getMinFromTime(String? time) {
    return time?.split(":")[1].split(" ")[0] ?? "0";
  }

  static Color getColorByStatus(int status) {
    return status == 0
        ? ColorRes.seashell
        : status == 1
        ? ColorRes.themeColor10
        : status == 2
        ? ColorRes.panache
        : ColorRes.mistyRose;
  }

  static Color getTextColorByStatus(int status) {
    return status == 0
        ? ColorRes.pumpkin
        : status == 1
        ? ColorRes.themeColor
        : status == 2
        ? ColorRes.apple
        : ColorRes.bitterSweet;
  }

  static String getTextByStatus(int status) {
    return status == 0
        ? AppLocalizations.of(Get.context!)!.bookingPending
        : status == 1
        ? AppLocalizations.of(Get.context!)!.bookingConfirmed
        : status == 2
        ? AppLocalizations.of(Get.context!)!.completed
        : status == 3
        ? AppLocalizations.of(Get.context!)!.cancelledBySalon
        : AppLocalizations.of(Get.context!)!.cancelledByYou;
  }

  static String convertTimeForService(int min) {
    if (min >= 60) {
      if (min == 60) {
        return '1 Hour';
      } else {
        if (min.remainder(60) == 0) {
          return '${min.minutes.inHours} Hours';
        }
        return '${min.minutes.inHours} hr ${min.remainder(60)} min';
      }
    } else {
      return '$min min';
    }
  }

  static String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"}";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"}";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"}";
    }
    if (diff.inDays > 0) {
      if (diff.inDays == 1) {
        return "Yesterday";
      }
      return "${diff.inDays} days";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"}";
    }
    return "just now";
  }

  static String getStringOfStatusByType(num status) {
    return status == 0
        ? 'Pending'
        : status == 1
        ? 'Completed'
        : 'Rejected';
  }

  static Color getColorOfWalletByType(num status) {
    return status == 0 ? ColorRes.bitterSweet : ColorRes.islamicGreen;
  }

  static String getPlusOrMinusOfWalletByType(num status) {
    return status == 0 ? '-' : '+';
  }

  static Color getBackgroundColorByStatus(num status) {
    return status == 0
        ? const Color(0xFFFF7A19)
        : status == 1
        ? const Color(0xFF35AB21)
        : const Color(0xFFFF2424);
  }

  static num calculateDiscountByPercentage(int? price, int? discount) {
    if (discount == null || discount == 0 || price == null || price == 0) {
      return 0;
    }
    return (price * discount) / 100;
  }

  static int? findSelectLanguageCode(List<String> languageCode) {
    return languageCode.indexOf(SharePref.selectedLanguage);
  }

  static String getPaymentType(num? paymentType) {
    /// PaymentType 0.PrePaid 1.PayAfterService
    return paymentType?.toInt() == 0
        ? AppLocalizations.of(Get.context!)!.prepaid
        : AppLocalizations.of(Get.context!)!.payAfterService;
  }

  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }

  static String convertMonthNumberToName(BuildContext context, int month) {
    String name = '';
    if (month == 1) {
      name = AppLocalizations.of(context)!.january;
    } else if (month == 2) {
      name = AppLocalizations.of(context)!.february;
    } else if (month == 3) {
      name = AppLocalizations.of(context)!.march;
    } else if (month == 4) {
      name = AppLocalizations.of(context)!.april;
    } else if (month == 5) {
      name = AppLocalizations.of(context)!.may_;
    } else if (month == 6) {
      name = AppLocalizations.of(context)!.june;
    } else if (month == 7) {
      name = AppLocalizations.of(context)!.july;
    } else if (month == 8) {
      name = AppLocalizations.of(context)!.august;
    } else if (month == 9) {
      name = AppLocalizations.of(context)!.september;
    } else if (month == 10) {
      name = AppLocalizations.of(context)!.october;
    } else if (month == 11) {
      name = AppLocalizations.of(context)!.november;
    } else if (month == 12) {
      name = AppLocalizations.of(context)!.december;
    }
    return name;
  }
}
