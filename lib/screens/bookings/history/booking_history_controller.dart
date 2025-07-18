import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/service/booking_service.dart';
import 'package:flutter/material.dart';

class BookingHistoryController extends BaseController {
  ScrollController scrollController = ScrollController();
  bool isFetching = false;
  int count = 0;
  List<BookingData> bookings = [];

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset ==
              scrollController.position.maxScrollExtent &&
          !isFetching) {
        fetchBookingsByStaff();
      }
    });
    init().then((value) {
      fetchBookingsByStaff();
    });
  }

  void fetchBookingsByStaff({bool isReset = false}) async {
    if (isReset) {
      bookings = [];
    }
    Booking booking = await BookingService().fetchBookingsByStaff(
      salonId: salonId,
      start: bookings.length,
    );
    bookings.addAll(booking.data ?? []);
    update();
  }
}
