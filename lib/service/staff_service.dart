import 'dart:convert';
import 'dart:io';
import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class StaffService {
  Future<Barber> logInStaff({
    required String salonNumber,
    required String phone,
    required String password,
  }) async {
    SharePref sharePref = await SharePref().init();
    final response = await http.post(
      Uri.parse(ConstRes.logInStaff),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.salonNumber: salonNumber,
        ConstRes.phone: phone,
        ConstRes.password: password,
        ConstRes.deviceToken: sharePref.getString(ConstRes.deviceToken) ?? '1',
      },
    );
    final responseJson = jsonDecode(response.body);
    sharePref.saveString(AppRes.user, response.body);
    Barber barber = Barber.fromJson(responseJson);
    ConstRes.userIdValue = barber.data?.id?.toInt() ?? -1;
    print(responseJson);
    return barber;
  }

  Future<Barber> fetchStaffData() async {
    SharePref sharePref = await SharePref().init();
    final response = await http.post(
      Uri.parse(ConstRes.fetchStaffData),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {ConstRes.staffId: ConstRes.userIdValue.toString()},
    );
    final responseJson = jsonDecode(response.body);
    Barber barber = Barber.fromJson(responseJson);
    ConstRes.userIdValue = barber.data?.id?.toInt() ?? -1;
    sharePref.saveString(AppRes.user, response.body);
    return barber;
  }

  Future<Barber> editStaff({
    required int? salonId,
    required int? staffId,
    required String name,
    required String phone,
    required String password,
    required int gender,
    required File? staffProfileImage,
  }) async {
    SharePref sharePref = await SharePref().init();
    var request = http.MultipartRequest(
      ConstRes.aPost,
      Uri.parse(ConstRes.editStaff),
    );
    request.headers.addAll({ConstRes.apiKey: ConstRes.apiKeyValue});
    request.fields[ConstRes.salonId] = salonId.toString();
    request.fields[ConstRes.staffId] = staffId.toString();
    request.fields[ConstRes.name] = name;
    request.fields[ConstRes.phone] = phone;
    request.fields[ConstRes.password] = password;
    request.fields[ConstRes.gender] = gender.toString();
    if (staffProfileImage != null) {
      request.files.add(
        http.MultipartFile(
          ConstRes.photo,
          staffProfileImage.readAsBytes().asStream(),
          staffProfileImage.lengthSync(),
          filename: staffProfileImage.path.split("/").last,
        ),
      );
    }
    var response = await request.send();
    var respStr = await response.stream.bytesToString();
    final responseJson = jsonDecode(respStr);
    sharePref.saveString(AppRes.user, respStr);
    return Barber.fromJson(responseJson);
  }
}
