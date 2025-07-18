import 'dart:convert';
import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/model/request/request_details.dart';
import 'package:halake_barber/model/rest/rest_response.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<Booking> fetchBookingsByStaff({
    required int salonId,
    required int start,
  }) async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchBookingsByStaff),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonId: salonId.toString(),
        ConstRes.staffId: ConstRes.userIdValue.toString(),
        ConstRes.start: start.toString(),
        ConstRes.count: ConstRes.count_.toString(),
      },
    );
    final responseJson = jsonDecode(response.body);
    return Booking.fromJson(responseJson);
  }

  Future<Booking> fetchStaffBookingRequests() async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchStaffBookingRequests),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {ConstRes.staffId: ConstRes.userIdValue.toString()},
    );
    final responseJson = jsonDecode(response.body);
    return Booking.fromJson(responseJson);
  }

  Future<Booking> fetchStaffBookingsByDate({required String date}) async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchStaffBookingsByDate),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.staffId: ConstRes.userIdValue.toString(),
        ConstRes.date: date,
      },
    );
    final responseJson = jsonDecode(response.body);
    return Booking.fromJson(responseJson);
  }

  Future<RequestDetails> fetchBookingDetails(
    int salonId,
    String bookingId,
  ) async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchBookingDetails),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonId: salonId.toString(),
        ConstRes.bookingId: bookingId.toString(),
      },
    );
    final responseJson = jsonDecode(response.body);
    return RequestDetails.fromJson(responseJson);
  }

  Future<RestResponse> acceptBooking(int salonId, String bookingId) async {
    final response = await http.post(
      Uri.parse(ConstRes.acceptBooking),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonId: salonId.toString(),
        ConstRes.bookingId: bookingId,
      },
    );
    final responseJson = jsonDecode(response.body);
    return RestResponse.fromJson(responseJson);
  }

  Future<RestResponse> rejectBooking(int salonId, String bookingId) async {
    final response = await http.post(
      Uri.parse(ConstRes.rejectBooking),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonId: salonId.toString(),
        ConstRes.bookingId: bookingId,
      },
    );
    final responseJson = jsonDecode(response.body);
    return RestResponse.fromJson(responseJson);
  }

  Future<RestResponse> completeBooking(
    int salonId,
    String bookingId,
    String completionOtp,
  ) async {
    final response = await http.post(
      Uri.parse(ConstRes.completeBooking),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonId: salonId.toString(),
        ConstRes.bookingId: bookingId,
        ConstRes.completionOtp: completionOtp,
      },
    );
    final responseJson = jsonDecode(response.body);
    return RestResponse.fromJson(responseJson);
  }
}
