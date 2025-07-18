import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/service/booking_service.dart';

class RequestController extends BaseController {
  List<BookingData> bookings = [];
  bool isLoading = true;

  // @override
  // void onInit() {
  //   fetchStaffBookingRequests();
  //   super.onInit();
  // }

  void fetchStaffBookingRequests() async {
    isLoading = true;
    update();
    var requests = await BookingService().fetchStaffBookingRequests();
    bookings = requests.data ?? [];
    isLoading = false;
    update();
  }
}
