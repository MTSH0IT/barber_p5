import 'package:halake_barber/utils/asset_res.dart';
import 'package:halake_barber/utils/color_res.dart';
import 'package:halake_barber/utils/style_res.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:halake_barber/l10n/app_localizations.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  final Color? textColor;
  final double? textSize;
  final bool? isShowSubTitle;
  final MainAxisAlignment? mainAxisAlignment;

  const AppLogo({
    super.key,
    this.textColor,
    this.textSize,
    this.isShowSubTitle = true,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.halake.toUpperCase(),
          style: TextStyle(
            color: textColor ?? ColorRes.white,
            fontFamily: AssetRes.fnGilroyBlack,
            fontSize: textSize ?? 22,
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            AppLocalizations.of(context)!.barber.toUpperCase(),
            style: kThinWhiteTextStyle.copyWith(fontSize: textSize ?? 22),
          ),
        ),
      ],
    );
  }
}

// class UserPlaceHolder extends StatelessWidget {
//   const UserPlaceHolder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Image(image: AssetImage(AssetRes.userPlaceholder));
//   }
// }

class CustomCircularInkWell extends StatelessWidget {
  final Widget? child;
  final Function()? onTap;

  const CustomCircularInkWell({super.key, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const WidgetStatePropertyAll(ColorRes.transparent),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: child,
    );
  }
}

class ToolBarWidget extends StatelessWidget {
  final String title;
  final Widget? child;

  const ToolBarWidget({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.smokeWhite,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 15),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCircularInkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image(
                  image: AssetImage(AssetRes.icBack),
                  color: ColorRes.themeColor,
                  height: 30,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    title,
                    style: kBoldThemeTextStyle.copyWith(fontSize: 18),
                  ),
                ),
                const Spacer(),
                child ?? const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget loadingImage(context, child, loadingProgress) {
  if (loadingProgress == null) {
    return child;
  }
  return const LoadingImage();
}

Widget loadingImageTransParent(context, child, loadingProgress) {
  if (loadingProgress == null) {
    return child;
  }
  return const SizedBox();
}

Widget errorBuilderForImage(context, error, stackTrace) {
  return const ImageNotFound();
}

class ImageNotFound extends StatelessWidget {
  final Color? color;
  final Color? tintcolor;

  const ImageNotFound({super.key, this.color, this.tintcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? ColorRes.smokeWhite,
      child: Center(
        child: Text(
          ':-('.toUpperCase(),
          style: kBoldThemeTextStyle.copyWith(
            color: tintcolor ?? ColorRes.smokeWhite1,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

class ImageNotFoundOval extends StatelessWidget {
  final Color? color;
  final Color? tintcolor;
  final double? fontSize;

  const ImageNotFoundOval({
    super.key,
    this.color,
    this.tintcolor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color ?? ColorRes.smokeWhite,
        child: Center(
          child: Text(
            ':-('.toUpperCase(),
            style: kBoldThemeTextStyle.copyWith(
              color: tintcolor ?? ColorRes.smokeWhite1,
              fontSize: fontSize ?? 50,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingImage extends StatelessWidget {
  final Color? color;

  const LoadingImage({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? ColorRes.smokeWhite,
      child: Center(
        child: Text(
          '...'.toUpperCase(),
          style: kBoldThemeTextStyle.copyWith(
            color: ColorRes.smokeWhite1,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(image: AssetImage(AssetRes.icNoData), width: 275),
        ),
      ],
    );
  }
}

class LoadingData extends StatelessWidget {
  final Color? color;

  const LoadingData({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? ColorRes.smokeWhite,
      child: const Center(
        child: CircularProgressIndicator(color: ColorRes.themeColor),
      ),
    );
  }
}

class BgRoundImageWidget extends StatelessWidget {
  final String image;
  final double? imagePadding;
  final double? height;
  final double? width;
  final Color? imageColor;
  final Color? bgColor;
  final Function()? onTap;

  const BgRoundImageWidget({
    super.key,
    required this.image,
    this.imagePadding,
    this.onTap,
    this.imageColor,
    this.bgColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircularInkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: width ?? 40,
        decoration: BoxDecoration(
          color: bgColor ?? ColorRes.themeColor10,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        padding: EdgeInsets.all(imagePadding ?? 0),
        child: Image(image: AssetImage(image), color: imageColor),
      ),
    );
  }
}

// class MenuWidget extends StatelessWidget {
//   const MenuWidget({
//     super.key,
//     required this.menuController,
//     required this.onMenuClick,
//     required this.index,
//     required this.title,
//     this.isLast = false,
//   });
//
//   final MenuController menuController;
//   final Function(int position) onMenuClick;
//   final int index;
//   final bool isLast;
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomCircularInkWell(
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isLast ? ColorRes.transparent : ColorRes.smokeWhite,
//             ),
//           ),
//         ),
//         padding: EdgeInsets.only(
//           bottom: isLast ? 0 : 10,
//           top: (isLast && index != 0) || index != 0 ? 10 : 0,
//           left: 20,
//           right: 20,
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: kMediumTextStyle.copyWith(
//               fontSize: 14,
//               color: ColorRes.mortar,
//             ),
//           ),
//         ),
//       ),
//       onTap: () {
//         onMenuClick(index);
//         menuController.close();
//       },
//     );
//   }
// }

// class ItemOptionsWidget extends StatelessWidget {
//   const ItemOptionsWidget({
//     super.key,
//     required this.index,
//     required this.title,
//     required this.isSelected,
//     required this.onClick,
//   });
//
//   final int index;
//   final String title;
//   final bool isSelected;
//   final Function(int position) onClick;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomCircularInkWell(
//       onTap: () {
//         onClick(index);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: isSelected ? ColorRes.themeColor : ColorRes.smokeWhite,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//         child: Text(
//           title,
//           style: kRegularWhiteTextStyle.copyWith(
//             fontSize: 16,
//             color: isSelected ? ColorRes.white : ColorRes.nero,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TextWithTextFieldSmokeWhiteWidget extends StatelessWidget {
  final String title;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const TextWithTextFieldSmokeWhiteWidget({
    super.key,
    required this.title,
    this.isPassword,
    this.controller,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLightWhiteTextStyle.copyWith(
            color: ColorRes.black,
            fontSize: 16,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorRes.smokeWhite,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: ColorRes.smokeWhite, width: 0.5),
          ),
          height: 55,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
            style: kRegularTextStyle.copyWith(color: ColorRes.charcoal50),
            keyboardType: textInputType,
            obscureText: isPassword ?? false,
            enableSuggestions: isPassword != null ? !isPassword! : true,
            autocorrect: isPassword != null ? !isPassword! : true,
          ),
        ),
      ],
    );
  }
}

class TextWithTextFieldWidget extends StatelessWidget {
  final String title;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const TextWithTextFieldWidget({
    super.key,
    required this.title,
    this.isPassword,
    this.controller,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: kLightWhiteTextStyle.copyWith(fontSize: 15)),
        Container(
          decoration: BoxDecoration(
            color: ColorRes.white.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
            style: kRegularWhiteTextStyle,
            keyboardType: textInputType,
            obscureText: isPassword ?? false,
            textCapitalization: TextCapitalization.sentences,
            enableSuggestions: isPassword != null ? !isPassword! : true,
            autocorrect: isPassword != null ? !isPassword! : true,
          ),
        ),
      ],
    );
  }
}
