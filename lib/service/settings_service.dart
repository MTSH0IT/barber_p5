import 'dart:convert';
import 'package:halake_barber/model/setting/setting.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class SettingsService {
  Future<Setting> fetchGlobalSettings() async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchGlobalSettings),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {ConstRes.userId: ConstRes.userIdValue.toString()},
    );
    final responseJson = jsonDecode(response.body);
    SharePref sharePref = await SharePref().init();
    sharePref.saveString(AppRes.settings, response.body);
    AppRes.currency = sharePref.getSettings()?.data?.currency ?? '';
    return Setting.fromJson(responseJson);
  }
}
