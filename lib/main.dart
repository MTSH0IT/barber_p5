import 'package:halake_barber/screens/welcome/welcome_screen.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
      locale: Locale(SharePref.selectedLanguage),
      debugShowCheckedModeBanner: false,
      title: 'Halake Barber',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorRes.white,
        textTheme: const TextTheme(
          displaySmall: TextStyle(color: ColorRes.white),
          displayLarge: TextStyle(color: ColorRes.white),
          displayMedium: TextStyle(color: ColorRes.white),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            ColorRes.themeColor.value,
            AppRes.getSwatch(ColorRes.themeColor),
          ),
        ).copyWith(surface: ColorRes.white),
      ),
      home: const WelComeScreen(),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
