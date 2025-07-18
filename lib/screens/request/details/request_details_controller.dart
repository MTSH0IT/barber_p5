import 'package:halake_barber/model/controller/base_controller.dart';
import 'package:halake_barber/model/request/request_details.dart';
import 'package:halake_barber/service/booking_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:get/get.dart';

class RequestDetailsController extends BaseController {
  RequestDetails? requestDetails;
  int type = 0;

  @override
  void onInit() {
    init().then((value) {
      fetchRequestDetails();
    });
    super.onInit();
  }

  void fetchRequestDetails() async {
    Map<String, dynamic> map = Get.arguments;
    RequestDetails requestDetails = await BookingService().fetchBookingDetails(
      salonId,
      map[ConstRes.bookingId],
    );
    this.requestDetails = requestDetails;
    type = map[ConstRes.type];
    if (this.requestDetails?.data != null) {
      update();
    }
  }

  void acceptBooking() {
    AppRes.showCustomLoader();
    BookingService()
        .acceptBooking(salonId, requestDetails?.data?.bookingId ?? '')
        .then((value) {
          AppRes.hideCustomLoaderWithBack();
          AppRes.showSnackBar(value.message ?? '', value.status ?? false);
          type = 1;
          // add(FetchRequestDetailEvent());
        });
  }

  void rejectBooking() {
    AppRes.showCustomLoader();
    BookingService()
        .rejectBooking(salonId, requestDetails?.data?.bookingId ?? '')
        .then((value) {
          AppRes.hideCustomLoaderWithBack();
          AppRes.showSnackBar(value.message ?? '', value.status ?? false);
          type = 1;
          // add(FetchRequestDetailEvent());
        });
  }
}
