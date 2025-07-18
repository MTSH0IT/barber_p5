import 'dart:async';

import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/screens/home/home_screen.dart';
import 'package:halake_barber/screens/login/login_screen.dart';
import 'package:halake_barber/service/settings_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:halake_barber/l10n/app_localizations.dart';

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({super.key});

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () => initData());
    return Scaffold(
      backgroundColor: ColorRes.themeColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo(textSize: 34),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.manageYourAppointmentsSlotsnprofileAndStayUpdated,
                  style: kThinWhiteTextStyle.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Center(
                child: CircularProgressIndicator(color: ColorRes.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void initData() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'halake-barber', // id
      'Notification', // title
      // 'This channel is used for bubbly notifications.', // description
      importance: Importance.max,
    );
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        if (kDebugMode) {
          print(
            'Message also contained a notification: ${message.notification}',
          );
        }
      }
      var initializationSettingsAndroid = const AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      var initializationSettingsIOS = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
      );
      FlutterLocalNotificationsPlugin().initialize(initializationSettings);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;

      if (notification != null && apple != null) {
        flutterLocalNotificationsPlugin.show(
          1,
          notification.title,
          notification.body,
          const NotificationDetails(iOS: DarwinNotificationDetails()),
        );
      }
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          1,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,
              // other properties...
            ),
          ),
        );
      }
    });

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    String? token = await FirebaseMessaging.instance.getToken();
    await SettingsService().fetchGlobalSettings();
    SharePref sharedPref = await SharePref().init();
    sharedPref.saveString(ConstRes.deviceToken, token);
    AppRes.currency = sharedPref.getSettings()?.data?.currency ?? '';
    Barber? salon = sharedPref.getBarberUser();
    ConstRes.userIdValue = salon?.data?.id?.toInt() ?? -1;
    if (salon != null) {
      Get.off(() => const HomeScreen());
    } else {
      Get.off(() => const LoginScreen());
    }
  }
}
