// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Unisex`
  String get unisex {
    return Intl.message(
      'Unisex',
      name: 'unisex',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Booking Pending`
  String get bookingPending {
    return Intl.message(
      'Booking Pending',
      name: 'bookingPending',
      desc: '',
      args: [],
    );
  }

  /// `Booking Confirmed`
  String get bookingConfirmed {
    return Intl.message(
      'Booking Confirmed',
      name: 'bookingConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled By Salon`
  String get cancelledBySalon {
    return Intl.message(
      'Cancelled By Salon',
      name: 'cancelledBySalon',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled By You`
  String get cancelledByYou {
    return Intl.message(
      'Cancelled By You',
      name: 'cancelledByYou',
      desc: '',
      args: [],
    );
  }

  /// `Pre-Paid`
  String get prepaid {
    return Intl.message(
      'Pre-Paid',
      name: 'prepaid',
      desc: '',
      args: [],
    );
  }

  /// `Pay After Service`
  String get payAfterService {
    return Intl.message(
      'Pay After Service',
      name: 'payAfterService',
      desc: '',
      args: [],
    );
  }

  /// `Halake`
  String get halake {
    return Intl.message(
      'Halake',
      name: 'halake',
      desc: '',
      args: [],
    );
  }

  /// `Barber`
  String get barber {
    return Intl.message(
      'Barber',
      name: 'barber',
      desc: '',
      args: [],
    );
  }

  /// `Manage Your Appointments, Slots,\nProfile and stay updated.`
  String get manageYourAppointmentsSlotsnprofileAndStayUpdated {
    return Intl.message(
      'Manage Your Appointments, Slots,\nProfile and stay updated.',
      name: 'manageYourAppointmentsSlotsnprofileAndStayUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to Continue`
  String get signInToContinue {
    return Intl.message(
      'Sign in to Continue',
      name: 'signInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Salon Number`
  String get salonNumber {
    return Intl.message(
      'Salon Number',
      name: 'salonNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `No Credentials? Contact Your Salon.`
  String get noCredentialsContactYourSalon {
    return Intl.message(
      'No Credentials? Contact Your Salon.',
      name: 'noCredentialsContactYourSalon',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Salon Number`
  String get pleaseEnterSalonNumber {
    return Intl.message(
      'Please Enter Salon Number',
      name: 'pleaseEnterSalonNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Mobile Number`
  String get pleaseEnterMobileNumber {
    return Intl.message(
      'Please Enter Mobile Number',
      name: 'pleaseEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please Enter Password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get bookings {
    return Intl.message(
      'Bookings',
      name: 'bookings',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Total Orders :`
  String get totalOrders {
    return Intl.message(
      'Total Orders :',
      name: 'totalOrders',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Booking History`
  String get bookingHistory {
    return Intl.message(
      'Booking History',
      name: 'bookingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Leave Requests`
  String get leaveRequests {
    return Intl.message(
      'Leave Requests',
      name: 'leaveRequests',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Terms Of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms Of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Barber Name`
  String get barberName {
    return Intl.message(
      'Barber Name',
      name: 'barberName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Image`
  String get pleaseSelectImage {
    return Intl.message(
      'Please Select Image',
      name: 'pleaseSelectImage',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Name`
  String get pleaseEnterName {
    return Intl.message(
      'Please Enter Name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Manage Slots`
  String get manageSlots {
    return Intl.message(
      'Manage Slots',
      name: 'manageSlots',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get dash {
    return Intl.message(
      '-',
      name: 'dash',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get bookingDetails {
    return Intl.message(
      'Booking Details',
      name: 'bookingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Service Location`
  String get serviceLocation {
    return Intl.message(
      'Service Location',
      name: 'serviceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Discount`
  String get couponDiscount {
    return Intl.message(
      'Coupon Discount',
      name: 'couponDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Type`
  String get paymentType {
    return Intl.message(
      'Payment Type',
      name: 'paymentType',
      desc: '',
      args: [],
    );
  }

  /// `Customer Review`
  String get customerReview {
    return Intl.message(
      'Customer Review',
      name: 'customerReview',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Accept Booking`
  String get acceptBooking {
    return Intl.message(
      'Accept Booking',
      name: 'acceptBooking',
      desc: '',
      args: [],
    );
  }

  /// `Different Location`
  String get differentLocation {
    return Intl.message(
      'Different Location',
      name: 'differentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Customer has chosen to Serve at different location as mentioned below. Are you sure to accept this order?`
  String get customerHasChosenToServeAtDifferentLocationAsMentioned {
    return Intl.message(
      'Customer has chosen to Serve at different location as mentioned below. Are you sure to accept this order?',
      name: 'customerHasChosenToServeAtDifferentLocationAsMentioned',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Mark As Complete`
  String get markAsComplete {
    return Intl.message(
      'Mark As Complete',
      name: 'markAsComplete',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Complete Booking`
  String get completeBooking {
    return Intl.message(
      'Complete Booking',
      name: 'completeBooking',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the completion OTP, below\nto complete the booking.\nAsk customer to provide the OTP.`
  String get pleaseEnterTheCompletionOtpBelowntoCompleteTheBookingnaskCustomer {
    return Intl.message(
      'Please enter the completion OTP, below\nto complete the booking.\nAsk customer to provide the OTP.',
      name: 'pleaseEnterTheCompletionOtpBelowntoCompleteTheBookingnaskCustomer',
      desc: '',
      args: [],
    );
  }

  /// `This order is pay after service order. Make sure to collect money from customer.`
  String get thisOrderIsPayAfterServiceOrderMakeSureTo {
    return Intl.message(
      'This order is pay after service order. Make sure to collect money from customer.',
      name: 'thisOrderIsPayAfterServiceOrderMakeSureTo',
      desc: '',
      args: [],
    );
  }

  /// `Booking Requests`
  String get bookingRequests {
    return Intl.message(
      'Booking Requests',
      name: 'bookingRequests',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get jan {
    return Intl.message(
      'Jan',
      name: 'jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get feb {
    return Intl.message(
      'Feb',
      name: 'feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get mar {
    return Intl.message(
      'Mar',
      name: 'mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get apr {
    return Intl.message(
      'Apr',
      name: 'apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get jun {
    return Intl.message(
      'Jun',
      name: 'jun',
      desc: '',
      args: [],
    );
  }

  /// `Jul`
  String get jul {
    return Intl.message(
      'Jul',
      name: 'jul',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get aug {
    return Intl.message(
      'Aug',
      name: 'aug',
      desc: '',
      args: [],
    );
  }

  /// `Sep`
  String get sep {
    return Intl.message(
      'Sep',
      name: 'sep',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get oct {
    return Intl.message(
      'Oct',
      name: 'oct',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get nov {
    return Intl.message(
      'Nov',
      name: 'nov',
      desc: '',
      args: [],
    );
  }

  /// `Dec`
  String get dec {
    return Intl.message(
      'Dec',
      name: 'dec',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get february {
    return Intl.message(
      'February',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get march {
    return Intl.message(
      'March',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get april {
    return Intl.message(
      'April',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get july {
    return Intl.message(
      'July',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get august {
    return Intl.message(
      'August',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get november {
    return Intl.message(
      'November',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get december {
    return Intl.message(
      'December',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may_ {
    return Intl.message(
      'May',
      name: 'may_',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get callNow {
    return Intl.message(
      'Call Now',
      name: 'callNow',
      desc: '',
      args: [],
    );
  }

  /// `Slots`
  String get slots {
    return Intl.message(
      'Slots',
      name: 'slots',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Slot`
  String get addSlot {
    return Intl.message(
      'Add Slot',
      name: 'addSlot',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Please select slot time between your availability.`
  String get pleaseSelectSlotTimeBetweenYourAvailability {
    return Intl.message(
      'Please select slot time between your availability.',
      name: 'pleaseSelectSlotTimeBetweenYourAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Time`
  String get pleaseSelectTime {
    return Intl.message(
      'Please Select Time',
      name: 'pleaseSelectTime',
      desc: '',
      args: [],
    );
  }

  /// `Delete Slot`
  String get deleteSlot {
    return Intl.message(
      'Delete Slot',
      name: 'deleteSlot',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete this slot?`
  String get doYouReallyWantToDeleteThisSlot {
    return Intl.message(
      'Do you really want to delete this slot?',
      name: 'doYouReallyWantToDeleteThisSlot',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Salon hasn't set their availability yet. Ask salon to add availability first.`
  String get salonHasntSetTheirAvailabilityYetAskSalonToAdd {
    return Intl.message(
      'Salon hasn\'t set their availability yet. Ask salon to add availability first.',
      name: 'salonHasntSetTheirAvailabilityYetAskSalonToAdd',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout ?`
  String get logoutDec {
    return Intl.message(
      'Do you really want to logout ?',
      name: 'logoutDec',
      desc: '',
      args: [],
    );
  }

  /// `QR Scan`
  String get qrScan {
    return Intl.message(
      'QR Scan',
      name: 'qrScan',
      desc: '',
      args: [],
    );
  }

  /// `Scan the booking QR to get the details quickly`
  String get scanTheBookingQrToGetTheDetailsQuickly {
    return Intl.message(
      'Scan the booking QR to get the details quickly',
      name: 'scanTheBookingQrToGetTheDetailsQuickly',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
