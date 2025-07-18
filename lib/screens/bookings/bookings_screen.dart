import 'dart:ui';

import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/screens/bookings/bookings_controller.dart';
import 'package:halake_barber/screens/bookings/select_month_dialog.dart';
import 'package:halake_barber/screens/qrScan/qr_scan_screen.dart';
import 'package:halake_barber/screens/request/details/request_details_screen.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/asset_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:halake_barber/l10n/app_localizations.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingsController bookingsController = Get.put(BookingsController());
    return GetBuilder(
      init: bookingsController,
      initState: (state) => bookingsController.fetchStaffBookingsByDate(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const QrScanScreen());
            },
            backgroundColor: ColorRes.themeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Image(image: AssetImage(AssetRes.icScan), height: 30),
          ),
          body: Column(
            children: [
              Container(
                color: ColorRes.themeColor5,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.bookings,
                        style: kLightWhiteTextStyle.copyWith(
                          color: ColorRes.themeColor,
                          fontSize: 22,
                        ),
                      ),
                      const Spacer(),
                      CustomCircularInkWell(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder:
                                (context) => SelectMonthDialog(
                                  onDoneClick: controller.onDoneClick,
                                  month: controller.month,
                                  year: controller.year,
                                ),
                          );
                          // await SimpleMonthYearPicker.showMonthYearPickerDialog(
                          //   context: context,
                          //   titleFontFamily: AssetRes.fnProductSansBlack,
                          //   selectionColor: ColorRes.themeColor,
                          //   monthTextFontFamily: AssetRes.fnProductSansMedium,
                          //   yearTextFontFamily: AssetRes.fnProductSansBold,
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.themeColor10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(AssetRes.icCalender),
                                height: 22,
                                width: 22,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '${AppRes.convertMonthNumberToName(context, controller.month)} ${controller.year}',
                                style: kMediumThemeTextStyle.copyWith(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TableCalendar(
                firstDay: DateTime.utc(controller.year, controller.month, 1),
                lastDay: DateTime.utc(
                  controller.year,
                  controller.month,
                  DateTime.utc(controller.year, controller.month + 1, 0).day,
                ),
                focusedDay: DateTime.utc(
                  controller.year,
                  controller.month,
                  controller.day,
                ),
                currentDay: DateTime.utc(
                  controller.year,
                  controller.month,
                  controller.day,
                ),
                calendarFormat: CalendarFormat.week,
                headerVisible: false,
                shouldFillViewport: false,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: const CalendarStyle(
                  cellMargin: EdgeInsets.all(0),
                  cellPadding: EdgeInsets.all(0),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    return AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: CustomCircularInkWell(
                        onTap: () {
                          controller.onTapDay(day);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.smokeWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: ColorRes.transparent,
                            dashPattern: const [2],
                            radius: const Radius.circular(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  day.day.toString(),
                                  style: kBoldThemeTextStyle.copyWith(
                                    fontSize: 20,
                                    color: ColorRes.empress,
                                  ),
                                ),
                                Text(
                                  DateFormat('EE').format(day).toUpperCase(),
                                  style: kRegularThemeTextStyle.copyWith(
                                    color: ColorRes.empress,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(width: double.infinity),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.smokeWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: ColorRes.transparent,
                          dashPattern: const [2],
                          radius: const Radius.circular(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style: kBoldThemeTextStyle.copyWith(
                                  fontSize: 20,
                                  color: ColorRes.empress,
                                ),
                              ),
                              Text(
                                DateFormat('EE').format(day).toUpperCase(),
                                style: kRegularThemeTextStyle.copyWith(
                                  color: ColorRes.empress,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: double.infinity),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.lavender,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: ColorRes.themeColor,
                          dashPattern: const [2],
                          radius: const Radius.circular(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style: kBoldThemeTextStyle.copyWith(
                                  fontSize: 20,
                                  color: ColorRes.themeColor,
                                ),
                              ),
                              Text(
                                DateFormat('EE').format(day).toUpperCase(),
                                style: kRegularThemeTextStyle.copyWith(
                                  color: ColorRes.themeColor,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: double.infinity),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  disabledBuilder: (context, day, focusedDay) {
                    return AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: CustomCircularInkWell(
                        onTap: () {
                          controller.onTapDay(day);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.smokeWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: ColorRes.transparent,
                            dashPattern: const [2],
                            radius: const Radius.circular(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  day.day.toString(),
                                  style: kBoldThemeTextStyle.copyWith(
                                    fontSize: 20,
                                    color: ColorRes.empress,
                                  ),
                                ),
                                Text(
                                  DateFormat('EE').format(day).toUpperCase(),
                                  style: kRegularThemeTextStyle.copyWith(
                                    color: ColorRes.empress,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(width: double.infinity),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                daysOfWeekHeight: 0,
              ),
              SizedBox(
                height: 0,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color:
                            index == 0
                                ? ColorRes.lavender
                                : ColorRes.smokeWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AspectRatio(
                        aspectRatio: 0.75 / 1,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color:
                              index == 0
                                  ? ColorRes.themeColor
                                  : ColorRes.transparent,
                          dashPattern: const [2],
                          radius: const Radius.circular(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${24 + index}',
                                style: kBoldThemeTextStyle.copyWith(
                                  fontSize: 24,
                                  color:
                                      index == 0
                                          ? ColorRes.themeColor
                                          : ColorRes.empress,
                                ),
                              ),
                              Text(
                                'WED',
                                style: kRegularThemeTextStyle.copyWith(
                                  color:
                                      index == 0
                                          ? ColorRes.themeColor
                                          : ColorRes.empress,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: double.infinity),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Text(
              //     '${state is DateSelectBookingState ? state.list.length : 0} ${AppLocalizations.of(context)!.appointments}',
              //     style: kRegularTextStyle,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.smokeWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: kLightWhiteTextStyle.copyWith(
                      color: ColorRes.empress,
                      fontSize: 15,
                    ),
                  ),
                  controller: controller.searchController,
                  style: kRegularTextStyle.copyWith(color: ColorRes.charcoal50),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Expanded(
                child:
                    controller.list.isNotEmpty
                        ? ListView.builder(
                          itemCount: controller.list.length,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            BookingData data = controller.list[index];
                            return ItemBookings(
                              data,
                              onUpdate: () {
                                controller.fetchStaffBookingsByDate();
                              },
                            );
                          },
                        )
                        : controller.isLoading
                        ? const Center(child: LoadingData(color: Colors.white))
                        : const Center(child: DataNotFound()),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemBookings extends StatelessWidget {
  final BookingData data;
  final Function() onUpdate;

  const ItemBookings(this.data, {super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.smokeWhite,
      margin: const EdgeInsets.only(bottom: 5),
      child: CustomCircularInkWell(
        onTap: () {
          Get.to(
            () => const RequestDetailsScreen(),
            arguments: {ConstRes.bookingId: data.bookingId, ConstRes.type: 1},
          )?.then((value) {
            onUpdate.call();
          });
        },
        child: Row(
          children: [
            SizedBox(
              width: 110,
              height: 110,
              child: Stack(
                children: [
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: FadeInImage.assetNetwork(
                      image:
                          '${ConstRes.itemBaseUrl}${data.user?.profileImage}',
                      fit: BoxFit.cover,
                      imageErrorBuilder: errorBuilderForImage,
                      placeholderErrorBuilder: loadingImage,
                      placeholder: '1',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRect(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        color: ColorRes.themeColor30,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Center(
                            child: Text(
                              AppRes.convert24HoursInto12Hours(data.time),
                              style: kSemiBoldTextStyle.copyWith(
                                color: ColorRes.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.user?.fullname?.capitalize}',
                    style: kSemiBoldTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${data.services?.length} ${AppLocalizations.of(context)!.services}',
                    style: kThinWhiteTextStyle.copyWith(color: ColorRes.black),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '${AppRes.currency}${data.payableAmount}',
                        style: kSemiBoldThemeTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          AppLocalizations.of(context)!.dash,
                          style: kLightWhiteTextStyle.copyWith(
                            color: ColorRes.themeColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppRes.convertTimeForService(
                            int.parse(data.duration ?? '0'),
                          ),
                          style: kLightWhiteTextStyle.copyWith(
                            color: ColorRes.themeColor,
                          ),
                        ),
                      ),
                      CustomCircularInkWell(
                        onTap: () {
                          launchUrl(Uri.parse('tel:${data.user?.phoneNumber}'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.smokeWhite1,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.callNow,
                            style: kRegularTextStyle.copyWith(
                              color: ColorRes.themeColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
