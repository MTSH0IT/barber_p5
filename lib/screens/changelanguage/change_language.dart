import 'package:halake_barber/main.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  int selectedIndex = 0;
  List<String> languageCode = ['ar', 'en'];
  int? value = 0;
  List<String> languages = ['عربي', 'English'];
  List<String> subLanguage = ['Arabic', 'English'];

  @override
  void initState() {
    value = AppRes.findSelectLanguageCode(languageCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ToolBarWidget(title: AppLocalizations.of(context)!.changeLanguage),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: index,
                  groupValue: value,
                  activeColor: Theme.of(context).colorScheme.primary,
                  dense: true,
                  onChanged: (value) async {
                    this.value = value as int;
                    SharePref sharedPref = await SharePref().init();

                    sharedPref.saveString(
                      ConstRes.languageCode,
                      languageCode[value],
                    );
                    SharePref.selectedLanguage = languageCode[value];
                    RestartWidget.restartApp(Get.context!);
                  },
                  title: Text(
                    languages[index],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                      fontFamily: kMediumTextStyle.fontFamily,
                    ),
                  ),
                  subtitle: Text(
                    subLanguage[index],
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
