import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:halake_barber/screens/bookings/history/booking_history_controller.dart';
import 'package:halake_barber/screens/bookings/history/history_widget.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingHistoryController bookingHistoryController = Get.put(
      BookingHistoryController(),
    );
    return GetBuilder(
      init: bookingHistoryController,
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              ToolBarWidget(
                title: AppLocalizations.of(context)!.bookingHistory,
              ),
              Expanded(
                child:
                    controller.isFetching
                        ? const LoadingData()
                        : controller.bookings.isEmpty
                        ? const DataNotFound()
                        : SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookingHistoryWidget(
                                bookings: controller.bookings.toList(),
                                onRefresh: () {
                                  controller.fetchBookingsByStaff(
                                    isReset: true,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}
