import 'package:halake_barber/screens/bookings/bookings_screen.dart';
import 'package:halake_barber/screens/home/home_controller.dart';
import 'package:halake_barber/screens/profile/profile_screen.dart';
import 'package:halake_barber/screens/request/request_screen.dart';
import 'package:halake_barber/utils/asset_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GetBuilder(
      init: homeController,
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pagerController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    BookingsScreen(),
                    RequestScreen(),
                    ProfileScreen(),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Obx(
                  () => Row(
                    children: [
                      const Spacer(),
                      BottomMenuItem(
                        image: AssetRes.icBooking,
                        imageSize: 26,
                        title: AppLocalizations.of(context)!.bookings,
                        menuIsSelected: controller.selectedIndex.value == 0,
                        nonSelectedImageSize: 26,
                        onTap: () {
                          controller.onSelectMenu(0);
                        },
                      ),
                      const Spacer(),
                      BottomMenuItem(
                        image: AssetRes.icRequest,
                        imageSize: 22,
                        title: AppLocalizations.of(context)!.requests,
                        menuIsSelected: controller.selectedIndex.value == 1,
                        nonSelectedImageSize: 26,
                        onTap: () {
                          controller.onSelectMenu(1);
                        },
                      ),
                      const Spacer(),
                      BottomMenuItem(
                        image: AssetRes.icBarber,
                        imageSize: 22,
                        title: AppLocalizations.of(context)!.profile,
                        nonSelectedImageSize: 26,
                        menuIsSelected: controller.selectedIndex.value == 2,
                        onTap: () {
                          controller.onSelectMenu(2);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomMenuItem extends StatelessWidget {
  final String image;
  final double imageSize;
  final String title;
  final bool menuIsSelected;
  final double? nonSelectedImageSize;
  final Function()? onTap;

  const BottomMenuItem({
    super.key,
    required this.image,
    required this.imageSize,
    required this.title,
    required this.menuIsSelected,
    this.nonSelectedImageSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircularInkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: menuIsSelected ? ColorRes.lavender : ColorRes.transparent,
        ),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              height: menuIsSelected ? imageSize : nonSelectedImageSize,
              color: menuIsSelected ? ColorRes.themeColor : ColorRes.darkGray,
            ),
            Visibility(
              visible: menuIsSelected,
              child: const SizedBox(width: 10),
            ),
            Visibility(
              visible: menuIsSelected,
              child: Text(
                title,
                style: kRegularTextStyle.copyWith(color: ColorRes.themeColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
