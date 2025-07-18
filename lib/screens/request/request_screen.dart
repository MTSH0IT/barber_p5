import 'package:halake_barber/model/bookings/booking.dart';
import 'package:halake_barber/screens/request/details/request_details_screen.dart';
import 'package:halake_barber/screens/request/request_controller.dart';
import 'package:halake_barber/utils/app_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:halake_barber/utils/custom/custom_widget.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RequestController requestController = Get.put(RequestController());
    return GetBuilder(
      init: requestController,
      initState: (state) {
        requestController.fetchStaffBookingRequests();
      },
      builder: (controller) {
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
                      AppLocalizations.of(context)!.bookingRequests,
                      style: kLightWhiteTextStyle.copyWith(
                        color: ColorRes.themeColor,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child:
                    controller.bookings.isNotEmpty
                        ? ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: controller.bookings.length,
                          itemBuilder: (context, index) {
                            BookingData data = controller.bookings[index];
                            return ItemBookingRequest(
                              data: data,
                              onUpdate: () {
                                requestController.fetchStaffBookingRequests();
                              },
                            );
                          },
                        )
                        : !controller.isLoading
                        ? const Center(child: DataNotFound())
                        : const Center(
                          child: LoadingData(color: ColorRes.white),
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemBookingRequest extends StatelessWidget {
  final BookingData data;
  final Function() onUpdate;

  const ItemBookingRequest({
    super.key,
    required this.data,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircularInkWell(
      onTap: () {
        Get.to(
          () => const RequestDetailsScreen(),
          arguments: {ConstRes.bookingId: data.bookingId, ConstRes.type: 0},
        )?.then((value) {
          onUpdate.call();
        });
      },
      child: Container(
        color: ColorRes.smokeWhite2,
        margin: const EdgeInsets.only(bottom: 5),
        child: AspectRatio(
          aspectRatio: 1 / .25,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 0.85 / 1,
                child: FadeInImage.assetNetwork(
                  image:
                      '${ConstRes.itemBaseUrl}${data.user?.profileImage ?? ''}',
                  fit: BoxFit.cover,
                  imageErrorBuilder: errorBuilderForImage,
                  placeholderErrorBuilder: loadingImage,
                  placeholder: '1',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppRes.formatDate(AppRes.parseDate(data.date ?? '', pattern: 'yyyy-MM-dd', isUtc: false), pattern: 'dd MMM, yyyy - EE', isUtc: false)} - ${AppRes.convert24HoursInto12Hours(data.time)}',
                      style: kLightWhiteTextStyle.copyWith(
                        color: ColorRes.empress,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data.user?.fullname?.capitalize ?? '',
                      style: kSemiBoldTextStyle.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    // Text(
                    //   '${data.services?.length ?? 0} ${AppLocalizations.of(context)!.services}',
                    //   style: kThinWhiteTextStyle.copyWith(
                    //     color: ColorRes.black,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      children: [
                        Text(
                          '${AppRes.currency}${data.payableAmount}',
                          style: kSemiBoldThemeTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            AppLocalizations.of(context)!.dash,
                            style: kLightWhiteTextStyle.copyWith(
                              color: ColorRes.themeColor,
                            ),
                          ),
                        ),
                        Text(
                          AppRes.convertTimeForService(
                            int.parse(data.duration ?? '0'),
                          ),
                          style: kLightWhiteTextStyle.copyWith(
                            color: ColorRes.themeColor,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
