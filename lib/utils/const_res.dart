class ConstRes {
  /// api url
  // static const String baseUrl = 'http://10.0.2.2:8000/api/';
  // static const String itemBaseUrl = 'http://10.0.2.2:8000/public/storage/';

  static const String baseUrl = 'https://api.halake.shop/api/';
  static const String itemBaseUrl = 'https://api.halake.shop/storage/';

  static String termsOfUseUrl = baseUrl.replaceAll('api/', 'termsOfUse');
  static String privacyPolicyUrl = baseUrl.replaceAll('api/', 'privacypolicy');
  static const String fetchGlobalSettings = '${baseUrl}fetchGlobalSettings';
  static const String logInStaff = '${baseUrl}logInStaff';
  static const String fetchStaffData = '${baseUrl}fetchStaffData';
  static const String editStaff = '${baseUrl}editStaff';
  static const String fetchBookingsByStaff = '${baseUrl}fetchBookingsByStaff';
  static const String fetchBookingDetails = '${baseUrl}fetchBookingDetails';
  static const String acceptBooking = '${baseUrl}acceptBooking';
  static const String rejectBooking = '${baseUrl}rejectBooking';
  static const String completeBooking = '${baseUrl}completeBooking';
  static const String fetchStaffBookingRequests = '${baseUrl}fetchStaffBookingRequests';
  static const String fetchStaffBookingsByDate = '${baseUrl}fetchStaffBookingsByDate';
  static const String addStaffSlot = '${baseUrl}addStaffSlot';
  static const String fetchStaffSlots = '${baseUrl}fetchStaffSlots';
  static const String deleteStaffSlot = '${baseUrl}deleteStaffSlot';

  ///Api Key
  static const String apiKey = 'apikey';
  static const String apiKeyValue = '123';
  static const String userId = 'user_id';
  static const String deviceToken = 'device_token';

  /// Api body keyword
  static const String identity = 'identity';
  static const String salonNumber = 'salon_number';
  static const String fullname = 'fullname';
  static const String phone = 'phone';
  static const String password = 'password';
  static const String staffId = 'staff_id';
  static const String photo = 'photo';
  static const String gender = 'gender';
  static const String name = 'name';
  static const String salonId = 'salon_id';
  static const String bookingId = 'booking_id';
  static const String completionOtp = 'completion_otp';
  static const String start = 'start';
  static const String count = 'count';
  static const String type = 'type';
  static const String date = 'date';
  static const String slotId = 'slot_id';
  static const String weekday = 'weekday';
  static const String time = 'time';

  static const int count_ = 10;
  static const String aPost = 'POST';

  static const String isLogin = 'is_login';

  static int userIdValue = -1;

  static String languageCode = 'language_code';
}
