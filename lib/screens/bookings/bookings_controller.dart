import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingsController extends BaseController {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  List<BookingData> list = [];
  List<BookingData> dummyList = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    searchController.addListener(() {
      String keyWord = searchController.text;
      list = dummyList;
      print(keyWord);
      if (keyWord.isNotEmpty) {
        list = [];
        for (BookingData bookingData in dummyList) {
          if (bookingData.bookingId?.toLowerCase().contains(
                    keyWord.toLowerCase(),
                  ) ==
                  true ||
              bookingData.user?.fullname?.toLowerCase().contains(
                    keyWord.toLowerCase(),
                  ) ==
                  true) {
            list.add(bookingData);
          }
        }
      }
      update();
    });
    super.onInit();
  }

  onDoneClick(int month, int year) {
    this.month = month;
    this.year = year;
    day = 1;
    fetchStaffBookingsByDate();
    update();
  }

  void onTapDay(DateTime dateTime) {
    month = dateTime.month;
    year = dateTime.year;
    day = dateTime.day;
    fetchStaffBookingsByDate();
    update();
  }

  void fetchStaffBookingsByDate() async {
    isLoading = true;
    update();
    var booking = await BookingService().fetchStaffBookingsByDate(
      date: DateFormat(
        'yyyy-MM-dd',
        Intl.defaultLocale,
      ).format(DateTime(year, month, day)),
    );
    isLoading = false;
    list = booking.data ?? [];
    dummyList = booking.data ?? [];
    update();
  }
}
