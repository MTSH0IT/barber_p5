import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  SharePref? sharePref;
  int salonId = -1;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<BarberData?> init() async {
    sharePref = await SharePref().init();
    salonId = sharePref?.getBarberUser()?.data?.salonId?.toInt() ?? -1;
    return sharePref?.getBarberUser()?.data;
  }
}
