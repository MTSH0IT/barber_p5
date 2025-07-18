import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/screens/bookings/history/booking_history_screen.dart';
import 'package:halake_barber/screens/changelanguage/change_language.dart';
import 'package:halake_barber/screens/profile/edit/edit_profile_screen.dart';
import 'package:halake_barber/screens/slots/manage_slots_screen.dart';
import 'package:halake_barber/screens/welcome/welcome_screen.dart';
import 'package:halake_barber/service/staff_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_bottom_sheet.dart';
import 'package:halake_barber/utils/custom/custom_dialog.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: ColorRes.themeColor5,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15),
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  AppLocalizations.of(context)!.profile,
                  style: kLightWhiteTextStyle.copyWith(
                    color: ColorRes.themeColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          const ProfileCardWidget(),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.bookingHistory,
            onTap: () => Get.to(() => const BookingHistoryScreen()),
          ),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.manageSlots,
            onTap: () => Get.to(() => const ManageSlotsScreen()),
          ),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.changeLanguage,
            onTap: () => Get.to(() => const ChangeLanguageScreen()),
          ),
          const SizedBox(height: 5),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.termsOfUse,
            onTap: () {
              _launchUrl(ConstRes.termsOfUseUrl);
            },
          ),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.privacyPolicy,
            onTap: () {
              _launchUrl(ConstRes.privacyPolicyUrl);
            },
          ),
          ItemSettingWidget(
            title: AppLocalizations.of(context)!.logOut,
            fontColor: ColorRes.bitterSweet,
            bgColor: ColorRes.bitterSweet10,
            onTap: () {
              Get.bottomSheet(
                ConfirmationBottomSheet(
                  title: AppLocalizations.of(context)!.logOut,
                  description: AppLocalizations.of(context)!.logoutDec,
                  buttonText: AppLocalizations.of(context)!.continue_,
                  onButtonClick: () async {
                    showDialog(
                      context: Get.context!,
                      builder: (context) {
                        return const CustomLoader();
                      },
                      barrierDismissible: false,
                    );
                    SharePref sharePref = await SharePref().init();
                    await sharePref.clear();
                    Get.offAll(() => const WelComeScreen());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({super.key});

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  SharePref? sharePref;
  Barber? barber;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorRes.smokeWhite,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(
                    '${ConstRes.itemBaseUrl}${barber?.data?.photo}',
                  ),
                  width: 75,
                  height: 75,
                  loadingBuilder: loadingImage,
                  errorBuilder: errorBuilderForImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${barber?.data?.name}', style: kBoldThemeTextStyle),
                  Row(
                    children: [
                      Text(
                        AppRes.getGenderTypeInStringFromNumber(
                          context,
                          barber?.data?.gender?.toInt() ?? 0,
                        ),
                        style: kLightWhiteTextStyle.copyWith(
                          color: ColorRes.mortar1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star_rounded,
                        color: ColorRes.pumpkin,
                        size: 20,
                      ),
                      Text('${barber?.data?.rating?.toInt() ?? 0}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.totalOrders,
                        style: kLightWhiteTextStyle.copyWith(
                          color: ColorRes.mortar1,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${barber?.data?.bookingsCount ?? 0}',
                        style: kBoldThemeTextStyle.copyWith(
                          color: ColorRes.mortar1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ItemSettingWidget(
          title: AppLocalizations.of(context)!.editProfile,
          onTap:
              () => Get.to(() => const EditProfileScreen())?.then((value) {
                initData();
              }),
        ),
      ],
    );
  }

  void initData() async {
    sharePref = await SharePref().init();
    barber = sharePref?.getBarberUser();
    StaffService().fetchStaffData().then((value) {
      barber = value;
      setState(() {});
    });
    setState(() {});
  }
}

class ItemSettingWidget extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? fontColor;
  final Function()? onTap;

  const ItemSettingWidget({
    super.key,
    required this.title,
    this.bgColor,
    this.fontColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircularInkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 3),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: bgColor ?? ColorRes.smokeWhite,
        child: Text(
          title,
          style: kLightWhiteTextStyle.copyWith(
            color: fontColor ?? ColorRes.mortar1,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
