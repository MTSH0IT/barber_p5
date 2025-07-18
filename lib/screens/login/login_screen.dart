import 'package:halake_barber/screens/login/login_controller.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return GetBuilder(
      init: loginController,
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorRes.themeColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          const AppLogo(
                            textSize: 30,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          Text(
                            AppLocalizations.of(context)!.signInToContinue,
                            style: kSemiBoldWhiteTextStyle,
                          ),
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.manageYourAppointmentsSlotsnprofileAndStayUpdated,
                            style: kThinWhiteTextStyle.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 40),
                          TextWithTextFieldWidget(
                            title: AppLocalizations.of(context)!.salonNumber,
                            controller: controller.salonNumberController,
                          ),
                          const SizedBox(height: 10),
                          TextWithTextFieldWidget(
                            title: AppLocalizations.of(context)!.mobileNumber,
                            controller: controller.mobileNumberController,
                            textInputType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          TextWithTextFieldWidget(
                            title: AppLocalizations.of(context)!.password,
                            controller: controller.passwordController,
                            isPassword: true,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: double.infinity,
                            height: 55,
                            child: TextButton(
                              style: kButtonWhiteStyle,
                              onPressed: controller.onTapContinue,
                              child: Text(
                                AppLocalizations.of(context)!.continue_,
                                style: kThemeButtonTextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              AppLocalizations.of(
                                context,
                              )!.noCredentialsContactYourSalon,
                              style: kRegularWhiteTextStyle,
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
