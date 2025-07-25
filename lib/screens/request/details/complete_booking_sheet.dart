import 'package:halake_barber/model/request/request_details.dart';
import 'package:halake_barber/model/rest/rest_response.dart';
import 'package:halake_barber/service/booking_service.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/custom/custom_bottom_sheet.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/shared_pref.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class CompleteBookingSheet extends StatelessWidget {
  const CompleteBookingSheet({super.key, required this.requestDetails});

  final RequestDetails requestDetails;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return SafeArea(
      bottom: false,
      child: Container(
        height: requestDetails.data?.paymentType?.toInt() == 1 ? 500 : 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.completeBooking,
                    style: kBoldThemeTextStyle,
                  ),
                  const Spacer(),
                  CloseButtonWidget(onTap: () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.pleaseEnterTheCompletionOtpBelowntoCompleteTheBookingnaskCustomer,
                      style: kLightWhiteTextStyle.copyWith(
                        fontSize: 16,
                        color: ColorRes.subTitleText,
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(height: 20),
                    TextWithTextFieldSmokeWhiteWidget(
                      title: '',
                      controller: textEditingController,
                      textInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 20),
                    Visibility(
                      visible: requestDetails.data?.paymentType?.toInt() == 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.info,
                                  color: ColorRes.burntSienna,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.payAfterService,
                                style: kMediumThemeTextStyle.copyWith(
                                  color: ColorRes.burntSienna,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.thisOrderIsPayAfterServiceOrderMakeSureTo,
                            style: kLightWhiteTextStyle.copyWith(
                              color: ColorRes.burntSienna,
                              fontSize: 16,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            SafeArea(
              top: false,
              child: Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () async {
                    if (textEditingController.text.isEmpty) {
                      AppRes.showSnackBar('Please enter OTP.', false);
                      return;
                    }
                    AppRes.showCustomLoader();
                    SharePref sharePref = await SharePref().init();
                    RestResponse restResponse = await BookingService()
                        .completeBooking(
                          sharePref.getBarberUser()?.data?.salonId?.toInt() ??
                              -1,
                          requestDetails.data?.bookingId ?? '',
                          textEditingController.text,
                        );
                    if (!restResponse.status!) {
                      AppRes.hideCustomLoaderWithBack();
                      AppRes.showSnackBar(restResponse.message ?? '', false);
                    } else {
                      Get.back();
                      AppRes.hideCustomLoaderWithBack();
                    }
                  },
                  style: kButtonThemeStyle.copyWith(
                    backgroundColor: const WidgetStatePropertyAll(
                      ColorRes.apple,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.complete,
                    style: kBlackButtonTextStyle.copyWith(
                      color: ColorRes.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
