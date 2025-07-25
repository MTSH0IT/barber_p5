import 'dart:convert';

import 'package:halake_barber/model/barber/barber.dart';
import 'package:halake_barber/model/bookings/order_summary.dart';
import 'package:halake_barber/model/service/services.dart';

class RequestDetails {
  RequestDetails({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  RequestDetails.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  RequestDetails copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      RequestDetails(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    num? id,
    num? status,
    String? bookingId,
    num? completionOtp,
    num? salonId,
    num? userId,
    String? date,
    String? time,
    String? duration,
    String? services,
    num? isCouponApplied,
    String? couponTitle,
    num? discountAmount,
    num? totalAmount,
    num? payableAmount,
    num? paymentType,
    num? isRated,
    num? serviceLocation,
    String? createdAt,
    String? updatedAt,
    Salon? salon,
    User? user,
    BarberData? staff,
    AddressData? serviceAddress,
    Review? review,
  }) {
    _id = id;
    _status = status;
    _bookingId = bookingId;
    _completionOtp = completionOtp;
    _salonId = salonId;
    _userId = userId;
    _date = date;
    _time = time;
    _duration = duration;
    _services = services;
    _isCouponApplied = isCouponApplied;
    _couponTitle = couponTitle;
    _discountAmount = discountAmount;
    _totalAmount = totalAmount;
    _payableAmount = payableAmount;
    _paymentType = paymentType;
    _isRated = isRated;
    _serviceLocation = serviceLocation;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _salon = salon;
    _user = user;
    _staff = staff;
    _serviceAddress = serviceAddress;
    _review = review;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _bookingId = json['booking_id'];
    _completionOtp = json['completion_otp'];
    _salonId = json['salon_id'];
    _userId = json['user_id'];
    _date = json['date'];
    _time = json['time'];
    _duration = json['duration'];
    _services = json['services'];
    _isCouponApplied = json['is_coupon_applied'];
    _couponTitle = json['coupon_title'];
    _discountAmount = json['discount_amount'];
    _totalAmount = json['total_amount'];
    _payableAmount = json['payable_amount'];
    _paymentType = json['payment_type'];
    _isRated = json['is_rated'];
    _serviceLocation = json['service_location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _salon = json['salon'] != null ? Salon.fromJson(json['salon']) : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _staff = json['staff'] != null ? BarberData.fromJson(json['staff']) : null;
    _serviceAddress = json['service_address'] != null
        ? AddressData.fromJson(json['service_address'])
        : null;
    _review = json['review'] != null ? Review.fromJson(json['review']) : null;
    convertService();
  }

  num? _id;
  num? _status;
  String? _bookingId;
  num? _completionOtp;
  num? _salonId;
  num? _userId;
  String? _date;
  String? _time;
  String? _duration;
  String? _services;
  num? _isCouponApplied;
  String? _couponTitle;
  num? _discountAmount;
  num? _totalAmount;
  num? _payableAmount;
  num? _paymentType;
  num? _isRated;
  num? _serviceLocation;
  String? _createdAt;
  String? _updatedAt;
  Salon? _salon;
  User? _user;
  BarberData? _staff;
  AddressData? _serviceAddress;
  Review? _review;

  Data copyWith({
    num? id,
    num? status,
    String? bookingId,
    num? completionOtp,
    num? salonId,
    num? userId,
    String? date,
    String? time,
    String? duration,
    String? services,
    num? isCouponApplied,
    String? couponTitle,
    num? discountAmount,
    num? totalAmount,
    num? payableAmount,
    num? paymentType,
    num? isRated,
    num? serviceLocation,
    String? createdAt,
    String? updatedAt,
    Salon? salon,
    User? user,
    BarberData? staff,
    AddressData? serviceAddress,
    Review? review,
  }) =>
      Data(
        id: id ?? _id,
        status: status ?? _status,
        bookingId: bookingId ?? _bookingId,
        completionOtp: completionOtp ?? _completionOtp,
        salonId: salonId ?? _salonId,
        userId: userId ?? _userId,
        date: date ?? _date,
        time: time ?? _time,
        duration: duration ?? _duration,
        services: services ?? _services,
        isCouponApplied: isCouponApplied ?? _isCouponApplied,
        couponTitle: couponTitle ?? _couponTitle,
        discountAmount: discountAmount ?? _discountAmount,
        totalAmount: totalAmount ?? _totalAmount,
        payableAmount: payableAmount ?? _payableAmount,
        paymentType: paymentType ?? _paymentType,
        isRated: isRated ?? _isRated,
        serviceLocation: serviceLocation ?? _serviceLocation,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        salon: salon ?? _salon,
        user: user ?? _user,
        staff: staff ?? _staff,
        serviceAddress: serviceAddress ?? _serviceAddress,
        review: review ?? _review,
      );

  num? get id => _id;

  num? get status => _status;

  String? get bookingId => _bookingId;

  num? get completionOtp => _completionOtp;

  num? get salonId => _salonId;

  num? get userId => _userId;

  String? get date => _date;

  String? get time => _time;

  String? get duration => _duration;

  List<ServiceData>? services = [];

  num? get isCouponApplied => _isCouponApplied;

  String? get couponTitle => _couponTitle;

  num? get discountAmount => _discountAmount;

  num? get totalAmount => _totalAmount;

  num? get payableAmount => _payableAmount;

  num? get paymentType => _paymentType;

  num? get isRated => _isRated;

  num? get serviceLocation => _serviceLocation;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Salon? get salon => _salon;

  User? get user => _user;

  BarberData? get staff => _staff;

  AddressData? get serviceAddress => _serviceAddress;

  Review? get review => _review;

  List<ServiceData> convertService() {
    services = [];
    OrderSummary orderSummary = getOrderSummary();
    services = orderSummary.services ?? [];
    return services ?? [];
  }

  OrderSummary getOrderSummary() {
    return OrderSummary.fromJson(jsonDecode(_services ?? ''));
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['booking_id'] = _bookingId;
    map['completion_otp'] = _completionOtp;
    map['salon_id'] = _salonId;
    map['user_id'] = _userId;
    map['date'] = _date;
    map['time'] = _time;
    map['duration'] = _duration;
    map['services'] = _services;
    map['is_coupon_applied'] = _isCouponApplied;
    map['coupon_title'] = _couponTitle;
    map['discount_amount'] = _discountAmount;
    map['total_amount'] = _totalAmount;
    map['payable_amount'] = _payableAmount;
    map['payment_type'] = _paymentType;
    map['is_rated'] = _isRated;
    map['service_location'] = _serviceLocation;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_salon != null) {
      map['salon'] = _salon?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_staff != null) {
      map['staff'] = _staff?.toJson();
    }
    if (_serviceAddress != null) {
      map['service_address'] = _serviceAddress?.toJson();
    }
    if (_review != null) {
      map['review'] = review?.toJson();
    }
    convertService();
    return map;
  }
}

class Review {
  Review({
    num? id,
    num? userId,
    num? salonId,
    num? bookingId,
    num? rating,
    String? comment,
    String? createdAt,
    String? updatedAt,
    UserData? user,
  }) {
    _id = id;
    _userId = userId;
    _salonId = salonId;
    _bookingId = bookingId;
    _rating = rating;
    _comment = comment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
  }

  Review.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _salonId = json['salon_id'];
    _bookingId = json['booking_id'];
    _rating = json['rating'];
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  num? _id;
  num? _userId;
  num? _salonId;
  num? _bookingId;
  num? _rating;
  String? _comment;
  String? _createdAt;
  String? _updatedAt;
  UserData? _user;

  Review copyWith({
    num? id,
    num? userId,
    num? salonId,
    num? bookingId,
    num? rating,
    String? comment,
    String? createdAt,
    String? updatedAt,
    UserData? user,
  }) =>
      Review(
        id: id ?? _id,
        userId: userId ?? _userId,
        salonId: salonId ?? _salonId,
        bookingId: bookingId ?? _bookingId,
        rating: rating ?? _rating,
        comment: comment ?? _comment,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        user: user ?? _user,
      );

  num? get id => _id;

  num? get userId => _userId;

  num? get salonId => _salonId;

  num? get bookingId => _bookingId;

  num? get rating => _rating;

  String? get comment => _comment;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  UserData? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['salon_id'] = _salonId;
    map['booking_id'] = _bookingId;
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    num? id,
    num? isBlock,
    String? identity,
    String? fullname,
    dynamic email,
    String? phoneNumber,
    String? profileImage,
    num? isNotification,
    num? deviceType,
    String? deviceToken,
    num? loginType,
    num? wallet,
    String? favouriteSalons,
    String? favouriteServices,
    String? couponsUsed,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _isBlock = isBlock;
    _identity = identity;
    _fullname = fullname;
    _email = email;
    _phoneNumber = phoneNumber;
    _profileImage = profileImage;
    _isNotification = isNotification;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _loginType = loginType;
    _wallet = wallet;
    _favouriteSalons = favouriteSalons;
    _favouriteServices = favouriteServices;
    _couponsUsed = couponsUsed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _isBlock = json['is_block'];
    _identity = json['identity'];
    _fullname = json['fullname'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _profileImage = json['profile_image'];
    _isNotification = json['is_notification'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _loginType = json['login_type'];
    _wallet = json['wallet'];
    _favouriteSalons = json['favourite_salons'];
    _favouriteServices = json['favourite_services'];
    _couponsUsed = json['coupons_used'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _isBlock;
  String? _identity;
  String? _fullname;
  dynamic _email;
  String? _phoneNumber;
  String? _profileImage;
  num? _isNotification;
  num? _deviceType;
  String? _deviceToken;
  num? _loginType;
  num? _wallet;
  String? _favouriteSalons;
  String? _favouriteServices;
  String? _couponsUsed;
  String? _createdAt;
  String? _updatedAt;

  User copyWith({
    num? id,
    num? isBlock,
    String? identity,
    String? fullname,
    dynamic email,
    dynamic phoneNumber,
    String? profileImage,
    num? isNotification,
    num? deviceType,
    String? deviceToken,
    num? loginType,
    num? wallet,
    String? favouriteSalons,
    String? favouriteServices,
    String? couponsUsed,
    String? createdAt,
    String? updatedAt,
  }) =>
      User(
        id: id ?? _id,
        isBlock: isBlock ?? _isBlock,
        identity: identity ?? _identity,
        fullname: fullname ?? _fullname,
        email: email ?? _email,
        phoneNumber: phoneNumber ?? _phoneNumber,
        profileImage: profileImage ?? _profileImage,
        isNotification: isNotification ?? _isNotification,
        deviceType: deviceType ?? _deviceType,
        deviceToken: deviceToken ?? _deviceToken,
        loginType: loginType ?? _loginType,
        wallet: wallet ?? _wallet,
        favouriteSalons: favouriteSalons ?? _favouriteSalons,
        favouriteServices: favouriteServices ?? _favouriteServices,
        couponsUsed: couponsUsed ?? _couponsUsed,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get isBlock => _isBlock;

  String? get identity => _identity;

  String? get fullname => _fullname;

  dynamic get email => _email;

  String? get phoneNumber => _phoneNumber;

  String? get profileImage => _profileImage;

  num? get isNotification => _isNotification;

  num? get deviceType => _deviceType;

  String? get deviceToken => _deviceToken;

  num? get loginType => _loginType;

  num? get wallet => _wallet;

  String? get favouriteSalons => _favouriteSalons;

  String? get favouriteServices => _favouriteServices;

  String? get couponsUsed => _couponsUsed;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['is_block'] = _isBlock;
    map['identity'] = _identity;
    map['fullname'] = _fullname;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['profile_image'] = _profileImage;
    map['is_notification'] = _isNotification;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['login_type'] = _loginType;
    map['wallet'] = _wallet;
    map['favourite_salons'] = _favouriteSalons;
    map['favourite_services'] = _favouriteServices;
    map['coupons_used'] = _couponsUsed;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Salon {
  Salon({
    num? id,
    num? wallet,
    num? lifetimeEarnings,
    num? deviceType,
    num? status,
    num? topRated,
    num? isNotification,
    num? onVacation,
    num? rating,
    String? salonNumber,
    String? email,
    String? salonName,
    String? ownerName,
    String? ownerPhoto,
    String? salonAbout,
    String? salonAddress,
    String? salonPhone,
    String? salonLat,
    String? salonLong,
    String? salonCategories,
    num? genderServed,
    String? monFriFrom,
    String? monFriTo,
    String? satSunFrom,
    String? satSunTo,
    String? deviceToken,
    num? totalRejectedBookings,
    num? totalCompletedBookings,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _wallet = wallet;
    _lifetimeEarnings = lifetimeEarnings;
    _deviceType = deviceType;
    _status = status;
    _topRated = topRated;
    _isNotification = isNotification;
    _onVacation = onVacation;
    _rating = rating;
    _salonNumber = salonNumber;
    _email = email;
    _salonName = salonName;
    _ownerName = ownerName;
    _ownerPhoto = ownerPhoto;
    _salonAbout = salonAbout;
    _salonAddress = salonAddress;
    _salonPhone = salonPhone;
    _salonLat = salonLat;
    _salonLong = salonLong;
    _salonCategories = salonCategories;
    _genderServed = genderServed;
    _monFriFrom = monFriFrom;
    _monFriTo = monFriTo;
    _satSunFrom = satSunFrom;
    _satSunTo = satSunTo;
    _deviceToken = deviceToken;
    _totalRejectedBookings = totalRejectedBookings;
    _totalCompletedBookings = totalCompletedBookings;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Salon.fromJson(dynamic json) {
    _id = json['id'];
    _wallet = json['wallet'];
    _lifetimeEarnings = json['lifetime_earnings'];
    _deviceType = json['device_type'];
    _status = json['status'];
    _topRated = json['top_rated'];
    _isNotification = json['is_notification'];
    _onVacation = json['on_vacation'];
    _rating = json['rating'];
    _salonNumber = json['salon_number'];
    _email = json['email'];
    _salonName = json['salon_name'];
    _ownerName = json['owner_name'];
    _ownerPhoto = json['owner_photo'];
    _salonAbout = json['salon_about'];
    _salonAddress = json['salon_address'];
    _salonPhone = json['salon_phone'];
    _salonLat = json['salon_lat'];
    _salonLong = json['salon_long'];
    _salonCategories = json['salon_categories'];
    _genderServed = json['gender_served'];
    _monFriFrom = json['mon_fri_from'];
    _monFriTo = json['mon_fri_to'];
    _satSunFrom = json['sat_sun_from'];
    _satSunTo = json['sat_sun_to'];
    _deviceToken = json['device_token'];
    _totalRejectedBookings = json['total_rejected_bookings'];
    _totalCompletedBookings = json['total_completed_bookings'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _wallet;
  num? _lifetimeEarnings;
  num? _deviceType;
  num? _status;
  num? _topRated;
  num? _isNotification;
  num? _onVacation;
  num? _rating;
  String? _salonNumber;
  String? _email;
  String? _salonName;
  String? _ownerName;
  String? _ownerPhoto;
  String? _salonAbout;
  String? _salonAddress;
  String? _salonPhone;
  String? _salonLat;
  String? _salonLong;
  String? _salonCategories;
  num? _genderServed;
  String? _monFriFrom;
  String? _monFriTo;
  String? _satSunFrom;
  String? _satSunTo;
  String? _deviceToken;
  num? _totalRejectedBookings;
  num? _totalCompletedBookings;
  String? _createdAt;
  String? _updatedAt;

  Salon copyWith({
    num? id,
    num? wallet,
    num? lifetimeEarnings,
    num? deviceType,
    num? status,
    num? topRated,
    num? isNotification,
    num? onVacation,
    num? rating,
    String? salonNumber,
    String? email,
    String? salonName,
    String? ownerName,
    String? ownerPhoto,
    String? salonAbout,
    String? salonAddress,
    String? salonPhone,
    String? salonLat,
    String? salonLong,
    String? salonCategories,
    num? genderServed,
    String? monFriFrom,
    String? monFriTo,
    String? satSunFrom,
    String? satSunTo,
    String? deviceToken,
    num? totalRejectedBookings,
    num? totalCompletedBookings,
    String? createdAt,
    String? updatedAt,
  }) =>
      Salon(
        id: id ?? _id,
        wallet: wallet ?? _wallet,
        lifetimeEarnings: lifetimeEarnings ?? _lifetimeEarnings,
        deviceType: deviceType ?? _deviceType,
        status: status ?? _status,
        topRated: topRated ?? _topRated,
        isNotification: isNotification ?? _isNotification,
        onVacation: onVacation ?? _onVacation,
        rating: rating ?? _rating,
        salonNumber: salonNumber ?? _salonNumber,
        email: email ?? _email,
        salonName: salonName ?? _salonName,
        ownerName: ownerName ?? _ownerName,
        ownerPhoto: ownerPhoto ?? _ownerPhoto,
        salonAbout: salonAbout ?? _salonAbout,
        salonAddress: salonAddress ?? _salonAddress,
        salonPhone: salonPhone ?? _salonPhone,
        salonLat: salonLat ?? _salonLat,
        salonLong: salonLong ?? _salonLong,
        salonCategories: salonCategories ?? _salonCategories,
        genderServed: genderServed ?? _genderServed,
        monFriFrom: monFriFrom ?? _monFriFrom,
        monFriTo: monFriTo ?? _monFriTo,
        satSunFrom: satSunFrom ?? _satSunFrom,
        satSunTo: satSunTo ?? _satSunTo,
        deviceToken: deviceToken ?? _deviceToken,
        totalRejectedBookings: totalRejectedBookings ?? _totalRejectedBookings,
        totalCompletedBookings:
            totalCompletedBookings ?? _totalCompletedBookings,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get wallet => _wallet;

  num? get lifetimeEarnings => _lifetimeEarnings;

  num? get deviceType => _deviceType;

  num? get status => _status;

  num? get topRated => _topRated;

  num? get isNotification => _isNotification;

  num? get onVacation => _onVacation;

  num? get rating => _rating;

  String? get salonNumber => _salonNumber;

  String? get email => _email;

  String? get salonName => _salonName;

  String? get ownerName => _ownerName;

  String? get ownerPhoto => _ownerPhoto;

  String? get salonAbout => _salonAbout;

  String? get salonAddress => _salonAddress;

  String? get salonPhone => _salonPhone;

  String? get salonLat => _salonLat;

  String? get salonLong => _salonLong;

  String? get salonCategories => _salonCategories;

  num? get genderServed => _genderServed;

  String? get monFriFrom => _monFriFrom;

  String? get monFriTo => _monFriTo;

  String? get satSunFrom => _satSunFrom;

  String? get satSunTo => _satSunTo;

  String? get deviceToken => _deviceToken;

  num? get totalRejectedBookings => _totalRejectedBookings;

  num? get totalCompletedBookings => _totalCompletedBookings;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['wallet'] = _wallet;
    map['lifetime_earnings'] = _lifetimeEarnings;
    map['device_type'] = _deviceType;
    map['status'] = _status;
    map['top_rated'] = _topRated;
    map['is_notification'] = _isNotification;
    map['on_vacation'] = _onVacation;
    map['rating'] = _rating;
    map['salon_number'] = _salonNumber;
    map['email'] = _email;
    map['salon_name'] = _salonName;
    map['owner_name'] = _ownerName;
    map['owner_photo'] = _ownerPhoto;
    map['salon_about'] = _salonAbout;
    map['salon_address'] = _salonAddress;
    map['salon_phone'] = _salonPhone;
    map['salon_lat'] = _salonLat;
    map['salon_long'] = _salonLong;
    map['salon_categories'] = _salonCategories;
    map['gender_served'] = _genderServed;
    map['mon_fri_from'] = _monFriFrom;
    map['mon_fri_to'] = _monFriTo;
    map['sat_sun_from'] = _satSunFrom;
    map['sat_sun_to'] = _satSunTo;
    map['device_token'] = _deviceToken;
    map['total_rejected_bookings'] = _totalRejectedBookings;
    map['total_completed_bookings'] = _totalCompletedBookings;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class AddressData {
  AddressData({
    num? id,
    num? userId,
    String? name,
    String? mobile,
    String? address,
    String? locality,
    String? city,
    String? pin,
    String? state,
    String? country,
    num? type,
    dynamic latitude,
    dynamic longitude,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _name = name;
    _mobile = mobile;
    _address = address;
    _locality = locality;
    _city = city;
    _pin = pin;
    _state = state;
    _country = country;
    _type = type;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  AddressData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _address = json['address'];
    _locality = json['locality'];
    _city = json['city'];
    _pin = json['pin'];
    _state = json['state'];
    _country = json['country'];
    _type = json['type'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _userId;
  String? _name;
  String? _mobile;
  String? _address;
  String? _locality;
  String? _city;
  String? _pin;
  String? _state;
  String? _country;
  num? _type;
  dynamic _latitude;
  dynamic _longitude;
  String? _createdAt;
  String? _updatedAt;

  AddressData copyWith({
    num? id,
    num? userId,
    String? name,
    String? mobile,
    String? address,
    String? locality,
    String? city,
    String? pin,
    String? state,
    String? country,
    num? type,
    dynamic latitude,
    dynamic longitude,
    String? createdAt,
    String? updatedAt,
  }) =>
      AddressData(
        id: id ?? _id,
        userId: userId ?? _userId,
        name: name ?? _name,
        mobile: mobile ?? _mobile,
        address: address ?? _address,
        locality: locality ?? _locality,
        city: city ?? _city,
        pin: pin ?? _pin,
        state: state ?? _state,
        country: country ?? _country,
        type: type ?? _type,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get userId => _userId;

  String? get name => _name;

  String? get mobile => _mobile;

  String? get address =>
      '${_address ?? ''}, ${locality ?? ''}, ${city ?? ''}, ${state ?? ''}, ${country ?? ''}, ${pin ?? ''}';

  String? get locality => _locality;

  String? get city => _city;

  String? get pin => _pin;

  String? get state => _state;

  String? get country => _country;

  num? get type => _type;

  dynamic get latitude => _latitude;

  dynamic get longitude => _longitude;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['locality'] = _locality;
    map['city'] = _city;
    map['pin'] = _pin;
    map['state'] = _state;
    map['country'] = _country;
    map['type'] = _type;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class UserData {
  UserData({
    num? id,
    num? isBlock,
    String? identity,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? profileImage,
    num? isNotification,
    num? deviceType,
    String? deviceToken,
    num? loginType,
    num? wallet,
    String? favouriteSalons,
    String? favouriteServices,
    dynamic couponsUsed,
    String? createdAt,
    String? updatedAt,
    num? bookingsCount,
  }) {
    _id = id;
    _isBlock = isBlock;
    _identity = identity;
    _fullname = fullname;
    _email = email;
    _phoneNumber = phoneNumber;
    _profileImage = profileImage;
    _isNotification = isNotification;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _loginType = loginType;
    _wallet = wallet;
    _favouriteSalons = favouriteSalons;
    _favouriteServices = favouriteServices;
    _couponsUsed = couponsUsed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _bookingsCount = bookingsCount;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _isBlock = json['is_block'];
    _identity = json['identity'];
    _fullname = json['fullname'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _profileImage = json['profile_image'];
    _isNotification = json['is_notification'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _loginType = json['login_type'];
    _wallet = json['wallet'];
    _favouriteSalons = json['favourite_salons'];
    _favouriteServices = json['favourite_services'];
    _couponsUsed = json['coupons_used'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _bookingsCount = json['bookings_count'];
  }

  num? _id;
  num? _isBlock;
  String? _identity;
  String? _fullname;
  String? _email;
  String? _phoneNumber;
  String? _profileImage;
  num? _isNotification;
  num? _deviceType;
  String? _deviceToken;
  num? _loginType;
  num? _wallet;
  String? _favouriteSalons;
  String? _favouriteServices;
  dynamic _couponsUsed;
  String? _createdAt;
  String? _updatedAt;
  num? _bookingsCount;

  UserData copyWith({
    num? id,
    num? isBlock,
    String? identity,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? profileImage,
    num? isNotification,
    num? deviceType,
    String? deviceToken,
    num? loginType,
    num? wallet,
    String? favouriteSalons,
    String? favouriteServices,
    dynamic couponsUsed,
    String? createdAt,
    String? updatedAt,
    num? bookingsCount,
  }) =>
      UserData(
        id: id ?? _id,
        isBlock: isBlock ?? _isBlock,
        identity: identity ?? _identity,
        fullname: fullname ?? _fullname,
        email: email ?? _email,
        phoneNumber: phoneNumber ?? _phoneNumber,
        profileImage: profileImage ?? _profileImage,
        isNotification: isNotification ?? _isNotification,
        deviceType: deviceType ?? _deviceType,
        deviceToken: deviceToken ?? _deviceToken,
        loginType: loginType ?? _loginType,
        wallet: wallet ?? _wallet,
        favouriteSalons: favouriteSalons ?? _favouriteSalons,
        favouriteServices: favouriteServices ?? _favouriteServices,
        couponsUsed: couponsUsed ?? _couponsUsed,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        bookingsCount: bookingsCount ?? _bookingsCount,
      );

  num? get id => _id;

  num? get isBlock => _isBlock;

  String? get identity => _identity;

  String? get fullname => _fullname;

  String? get email => _email;

  String? get phoneNumber => _phoneNumber;

  String? get profileImage => _profileImage;

  num? get isNotification => _isNotification;

  num? get deviceType => _deviceType;

  String? get deviceToken => _deviceToken;

  num? get loginType => _loginType;

  num? get wallet => _wallet;

  String? get favouriteSalons => _favouriteSalons;

  String? get favouriteServices => _favouriteServices;

  dynamic get couponsUsed => _couponsUsed;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get bookingsCount => _bookingsCount;

  bool isFavouriteSalon(int salonID) {
    List<String> ids = favouriteSalons?.split(',') ?? [];
    return ids.contains(salonID.toString());
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['is_block'] = _isBlock;
    map['identity'] = _identity;
    map['fullname'] = _fullname;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['profile_image'] = _profileImage;
    map['is_notification'] = _isNotification;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['login_type'] = _loginType;
    map['wallet'] = _wallet;
    map['favourite_salons'] = _favouriteSalons;
    map['favourite_services'] = _favouriteServices;
    map['coupons_used'] = _couponsUsed;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['bookings_count'] = _bookingsCount;
    return map;
  }
}
