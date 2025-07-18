import 'package:halake_barber/screens/profile/edit/edit_profile_controller.dart';
import 'package:halake_barber/utils/asset_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileController editProfileController = Get.put(
      EditProfileController(),
    );
    return GetBuilder(
      init: editProfileController,
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              ToolBarWidget(title: AppLocalizations.of(context)!.editProfile),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Stack(
                            children: [
                              ClipOval(
                                child:
                                    controller.imageFile != null
                                        ? Image(
                                          image: FileImage(
                                            controller.imageFile!,
                                          ),
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        )
                                        : Image(
                                          image: NetworkImage(
                                            '${ConstRes.itemBaseUrl}${controller.barberData?.photo}',
                                          ),
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 0,
                                child: CustomCircularInkWell(
                                  onTap: controller.onTapImage,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorRes.themeColor,
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(AssetRes.icEdit),
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextWithTextFieldSmokeWhiteWidget(
                          title: AppLocalizations.of(context)!.barberName,
                          textInputType: TextInputType.emailAddress,
                          controller: controller.nameController,
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.mobileNumber,
                              style: kLightWhiteTextStyle.copyWith(
                                color: ColorRes.black,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorRes.smokeWhite,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  color: ColorRes.smokeWhite,
                                  width: 0.5,
                                ),
                              ),
                              height: 55,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.mobileNumberController.text,
                                  style: kRegularTextStyle.copyWith(
                                    color: ColorRes.charcoal50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextWithTextFieldSmokeWhiteWidget(
                          title: AppLocalizations.of(context)!.password,
                          isPassword: true,
                          controller: controller.passwordController,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppLocalizations.of(context)!.gender,
                          style: kLightWhiteTextStyle.copyWith(
                            color: ColorRes.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => Row(
                            children: [
                              GenderWidget(
                                isSelected: controller.isMale.value == 1,
                                title: AppLocalizations.of(context)!.male,
                                onTap: () {
                                  controller.onTapGender(1);
                                },
                              ),
                              const SizedBox(width: 20),
                              GenderWidget(
                                isSelected: controller.isMale.value == 0,
                                title: AppLocalizations.of(context)!.female,
                                onTap: () {
                                  controller.onTapGender(0);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  height: 55,
                  child: TextButton(
                    style: kButtonThemeStyle,
                    onPressed: controller.onTapUpdate,
                    child: Text(
                      AppLocalizations.of(context)!.update,
                      style: kMediumWhiteTextStyle.copyWith(fontSize: 16),
                    ),
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

class GenderWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function() onTap;

  const GenderWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircularInkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ColorRes.lavender : ColorRes.smokeWhite,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected ? ColorRes.themeColor : ColorRes.smokeWhite,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
        child: Text(
          title,
          style: kRegularThemeTextStyle.copyWith(
            color: isSelected ? ColorRes.themeColor : ColorRes.darkGray,
          ),
        ),
      ),
    );
  }
}
