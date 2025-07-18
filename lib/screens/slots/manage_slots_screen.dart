import 'package:halake_barber/model/slot/slot.dart';
import 'package:halake_barber/screens/slots/manage_slots_controller.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/asset_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_bottom_sheet.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:halake_barber/l10n/app_localizations.dart';

class ManageSlotsScreen extends StatelessWidget {
  const ManageSlotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ManageSlotsController slotsController = Get.put(ManageSlotsController());
    return GetBuilder(
      init: slotsController,
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              ToolBarWidget(title: AppLocalizations.of(context)!.manageSlots),
              SlotsWidget(controller: controller),
            ],
          ),
        );
      },
    );
  }
}

class SlotsWidget extends StatelessWidget {
  final ManageSlotsController controller;

  const SlotsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          controller.isLoading
              ? const Center(
                child: CircularProgressIndicator(color: ColorRes.themeColor),
              )
              : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: DateFormat().dateSymbols.WEEKDAYS.length,
                itemBuilder: (context, index) {
                  List<SlotData>? slots =
                      controller.salonSlots[DateFormat()
                          .dateSymbols
                          .WEEKDAYS[index]];
                  slots?.sort((a, b) {
                    return (a.time ?? "").compareTo(b.time ?? "");
                  });
                  return Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: ExpansionTile(
                      backgroundColor: ColorRes.smokeWhite,
                      tilePadding: const EdgeInsets.only(right: 10),
                      collapsedBackgroundColor: ColorRes.smokeWhite,
                      iconColor: ColorRes.subTitleText,
                      collapsedIconColor: ColorRes.subTitleText,
                      childrenPadding: EdgeInsets.zero,
                      dense: false,
                      title: Container(
                        color: ColorRes.smokeWhite,
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 15,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat().dateSymbols.WEEKDAYS[index]
                                      .toUpperCase(),
                                  style: kBoldThemeTextStyle.copyWith(
                                    color: ColorRes.charcoal,
                                    letterSpacing: 2,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${slots?.length ?? 0} ${AppLocalizations.of(context)!.slots}',
                                  style: kRegularEmpressTextStyle.copyWith(
                                    color: ColorRes.subTitleText,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CustomCircularInkWell(
                              onTap: () {
                                if (controller.monFriFrom == null ||
                                    controller.monFriTo == null ||
                                    controller.satSunFrom == null ||
                                    controller.satSunTo == null) {
                                  AppRes.showSnackBar(
                                    AppLocalizations.of(
                                      context,
                                    )!.salonHasntSetTheirAvailabilityYetAskSalonToAdd,
                                    false,
                                  );
                                  return;
                                }
                                Get.bottomSheet(
                                  AddSlotDialog(
                                    nameOfDay:
                                        controller.salonSlots.keys
                                            .toList()[index],
                                    onTimeSlotClick: (timeSelect) {
                                      controller.onSlotTimeClick(
                                        index,
                                        timeSelect,
                                      );
                                    },
                                    onClickSubmit: (timeOfDay, slotLimit) {
                                      controller.onAddSlotClick(
                                        timeOfDay,
                                        slotLimit,
                                        index,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: ColorRes.themeColor10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.add,
                                  style: kMediumThemeTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          width: double.infinity,
                          color: ColorRes.smokeWhite2,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child:
                              slots == null || slots.isEmpty == true
                                  ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'No Slots Available',
                                        style: kSemiBoldTextStyle.copyWith(
                                          color: ColorRes.subTitleText,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  : Wrap(
                                    alignment: WrapAlignment.start,
                                    children: List.generate(slots.length, (
                                      index,
                                    ) {
                                      return SizedBox(
                                        width: 120,
                                        child: Stack(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ColorRes.smokeWhite,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 12,
                                                  ),
                                              margin: const EdgeInsets.only(
                                                left: 10,
                                                right: 8,
                                                top: 8,
                                                bottom: 10,
                                              ),
                                              child: Text(
                                                AppRes.convert24HoursInto12Hours(
                                                  slots[index].time,
                                                ),
                                                style: kSemiBoldThemeTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CustomCircularInkWell(
                                                onTap: () {
                                                  controller.deleteSlotBooking(
                                                    slots[index],
                                                  );
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: ColorRes.charcoal,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                  ),
                                                  child: const Icon(
                                                    Icons.close_rounded,
                                                    color: ColorRes.white,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}

class AddSlotDialog extends StatefulWidget {
  final String nameOfDay;
  final Function(Function(TimeOfDay? time) timeSelect) onTimeSlotClick;
  final Function(TimeOfDay? time, int slotLimit) onClickSubmit;

  const AddSlotDialog({
    super.key,
    required this.nameOfDay,
    required this.onTimeSlotClick,
    required this.onClickSubmit,
  });

  @override
  State<AddSlotDialog> createState() => _AddSlotDialogState();
}

class _AddSlotDialogState extends State<AddSlotDialog> {
  int selectedSlotCount = 1;
  String? time;
  TimeOfDay? timeOfDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${AppLocalizations.of(context)!.addSlot} (${widget.nameOfDay})',
                style: kBoldThemeTextStyle,
              ),
              const Spacer(),
              CloseButtonWidget(onTap: () {}),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.selectTime,
                      style: kLightWhiteTextStyle.copyWith(
                        color: ColorRes.mortar,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.onTimeSlotClick((time) {
                          if (time == null) return;
                          timeOfDay = time;
                          this.time =
                              '${0.convert2Digits(time.hourOfPeriod)}:${0.convert2Digits(time.minute)} ${time.period.name.toUpperCase()}';
                          setState(() {});
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorRes.smokeWhite,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(AssetRes.icCalender),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              time ?? '00:00',
                              style: kLightWhiteTextStyle.copyWith(
                                color: ColorRes.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: false,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Slot Limit',
                        style: kLightWhiteTextStyle.copyWith(
                          color: ColorRes.mortar,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: ColorRes.smokeWhite,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: DropdownButton<int>(
                          value: selectedSlotCount,
                          padding: const EdgeInsets.all(0),
                          dropdownColor: ColorRes.white,
                          borderRadius: BorderRadius.circular(10),
                          menuMaxHeight: 350,
                          underline: const SizedBox(),
                          items: List.generate(AppRes.limitOfSlots, (index) {
                            return DropdownMenuItem<int>(
                              value: index + 1,
                              child: Container(
                                width: 150,
                                height: 100,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2.5,
                                ),
                                decoration: const BoxDecoration(
                                  color: ColorRes.smokeWhite,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: kLightWhiteTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          onChanged: (value) {
                            selectedSlotCount = value ?? 1;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton(
                onPressed: () {
                  widget.onClickSubmit(timeOfDay, selectedSlotCount);
                },
                style: kButtonThemeStyle,
                child: Text(
                  AppLocalizations.of(context)!.submit,
                  style: kBlackButtonTextStyle.copyWith(color: ColorRes.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension Convert2Digits on int {
  String convert2Digits(int? value) {
    return value.toString().length < 2 ? '0$value' : value.toString();
  }
}
