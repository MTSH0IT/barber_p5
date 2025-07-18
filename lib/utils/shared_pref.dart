import 'dart:convert';
import 'dart:io';

import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/model/setting/setting.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  SharedPreferences? _sharedPreferences;
  static String selectedLanguage = Platform.localeName.split('_')[0];
  static var cartCount = 0.obs;

  Future<SharePref> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    // cartCount.value = getCartServices().length;
    return this;
  }

  Future saveString(String key, String? value) async {
    await _sharedPreferences?.setString(key, value ?? "");
  }

  String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  Future saveDouble(String key, double? value) async {
    await _sharedPreferences?.setDouble(key, value ?? 0);
  }

  double? getDouble(String key) {
    return _sharedPreferences?.getDouble(key);
  }

  bool getLogin(String key) {
    return _sharedPreferences?.getBool(key) == null
        ? false
        : _sharedPreferences!.getBool(key)!;
  }

  Future setLogin(String key, bool value) async {
    await _sharedPreferences?.setBool(key, value);
  }

  Barber? getBarberUser() {
    if (getString(AppRes.user) == null) return null;
    Barber? salonUser = Barber.fromJson(
      jsonDecode(_sharedPreferences!.getString(AppRes.user)!),
    );
    return salonUser;
  }

  Setting? getSettings() {
    if (getString(AppRes.settings) == null) return null;
    return Setting.fromJson(
      jsonDecode(_sharedPreferences!.getString(AppRes.settings)!),
    );
  }

  //
  // List<Services?> getCartServices() {
  //   if (getString(ConstRes.cart) == null) return [];
  //   String? stdCart = getString(ConstRes.cart);
  //   List<Services?> services = [];
  //   jsonDecode(stdCart ?? '').forEach((v) {
  //     services.add(Services.fromJson(v));
  //   });
  //   return services;
  // }
  //
  // bool isAlreadyInCart(int? id) {
  //   List<Services?> services = getCartServices();
  //
  //   Services? serviceData = services.isEmpty
  //       ? null
  //       : services.firstWhereOrNull(
  //           (element) {
  //             return element?.id == id;
  //           },
  //         );
  //   return serviceData != null;
  // }
  //
  // Future addToCartService(Services? serviceData) {
  //   SalonUser? salonUser = getSalonUser();
  //   if (salonUser?.data?.isBlock?.toInt() == 1) {
  //     AppRes.showSnackBar('You are blocked by Admin', false);
  //     return saveString(ConstRes.cart, jsonEncode([]));
  //   }
  //   List<Services?> services = getCartServices();
  //   services.add(serviceData);
  //   cartCount.value = getCartServices().length;
  //
  //   return saveString(ConstRes.cart, jsonEncode(services));
  // }
  //
  // Future removeCartService(Services? serviceData) {
  //   List<Services?> services = getCartServices();
  //   services.removeWhere(
  //     (element) => element?.id == serviceData?.id,
  //   );
  //   cartCount.value = getCartServices().length;
  //   return saveString(ConstRes.cart, jsonEncode(services));
  // }

  Future<dynamic>? clear() {
    return _sharedPreferences?.clear();
  }
}
