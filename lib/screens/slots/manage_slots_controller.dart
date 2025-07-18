import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/model/slot/slot.dart';
import 'package:halake_barber/screens/slots/manage_slots_screen.dart';
import 'package:halake_barber/service/staff_service.dart';
import 'package:halake_barber/service/slot_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:halake_barber/l10n/app_localizations.dart';

class ManageSlotsController extends BaseController {
  BarberData? staffData;
  Map<String, List<SlotData>> salonSlots = {};
  String? monFriFrom;
  String? monFriTo;
  String? satSunFrom;

  String? satSunTo;

  @override
  void onInit() {
    StaffService().fetchStaffData().then((value) {
      staffData = value.data;
      monFriFrom = AppRes.convert24HoursInto12Hours(
        value.data?.salon?.monFriFrom,
      );
      monFriTo = AppRes.convert24HoursInto12Hours(value.data?.salon?.monFriTo);
      satSunFrom = AppRes.convert24HoursInto12Hours(
        value.data?.salon?.satSunFrom,
      );
      satSunTo = AppRes.convert24HoursInto12Hours(value.data?.salon?.satSunTo);
      fetchSlots();
    });
    super.onInit();
  }

  void onSlotTimeClick(int index, Function(TimeOfDay? time) timeSelect) async {
    TimeOfDay? selectedTimeRTL = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(Get.context!).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorRes.themeColor,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    print(satSunTo);
    if (index == 0 || index == 6) {
      if (AppRes.isAvailableForAdd(
        satSunFrom ?? '0',
        satSunTo ?? '0',
        selectedTimeRTL ?? TimeOfDay.now(),
      )) {
        timeSelect.call(selectedTimeRTL);
      } else {
        AppRes.showSnackBar(
          '${AppLocalizations.of(Get.context!)!.pleaseSelectSlotTimeBetweenYourAvailability} ($satSunFrom to $satSunTo)',
          false,
        );
      }
    } else {
      if (AppRes.isAvailableForAdd(
        monFriFrom ?? '0',
        monFriTo ?? '0',
        selectedTimeRTL ?? TimeOfDay.now(),
      )) {
        timeSelect.call(selectedTimeRTL);
      } else {
        AppRes.showSnackBar(
          '${AppLocalizations.of(Get.context!)!.pleaseSelectSlotTimeBetweenYourAvailability} ($monFriFrom to $monFriTo)',
          false,
        );
      }
    }
  }

  void onAddSlotClick(TimeOfDay? timeOfDay, int slotLimit, int index) async {
    int weekDay = 1;
    if (index == 0) {
      weekDay = 7;
    } else if (index >= 1 && index <= 5) {
      weekDay = index;
    } else {
      weekDay = index;
    }
    if (timeOfDay == null) {
      AppRes.showSnackBar(
        AppLocalizations.of(Get.context!)!.pleaseSelectTime,
        false,
      );
      return;
    }
    AppRes.showCustomLoader();

    await SlotService().addStaffSlot(
      staffData?.id?.toInt() ?? -1,
      '${0.convert2Digits(timeOfDay.hour)}${0.convert2Digits(timeOfDay.minute)}',
      weekDay.toString(),
    );
    AppRes.hideCustomLoaderWithBack();
    fetchSlots();
  }

  bool isLoading = true;

  void fetchSlots() async {
    List<SlotData> slots = [];
    isLoading = true;
    update();
    Slot? slot = await SlotService().fetchStaffSlots(
      staffData?.id?.toInt() ?? -1,
    );
    slots = slot?.data ?? [];
    List.generate(DateFormat().dateSymbols.WEEKDAYS.length, (index) {
      salonSlots[DateFormat().dateSymbols.WEEKDAYS[index]] =
          slots.where((element) {
            int weekDay;
            if (index == 0) {
              weekDay = 7;
            } else if (index >= 1 && index <= 5) {
              weekDay = index;
            } else {
              weekDay = index;
            }
            return element.weekday == weekDay;
          }).toList();
    });
    isLoading = false;
    update();
  }

  void deleteSlotBooking(SlotData? slotData) {
    Get.bottomSheet(
      ConfirmationBottomSheet(
        title:
            '${AppLocalizations.of(Get.context!)!.deleteSlot} (${AppRes.convert24HoursInto12Hours(slotData?.time)})',
        description:
            AppLocalizations.of(Get.context!)!.doYouReallyWantToDeleteThisSlot,
        buttonText: AppLocalizations.of(Get.context!)!.delete,
        onButtonClick: () async {
          AppRes.showCustomLoader();
          await SlotService().deleteStaffSlot(slotData?.id?.toInt() ?? -1);
          AppRes.hideCustomLoaderWithBack();
          fetchSlots();
        },
      ),
    );
  }
}
