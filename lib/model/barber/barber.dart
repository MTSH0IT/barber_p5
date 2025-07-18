class Barber {
  Barber({
    bool? status,
    String? message,
    BarberData? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  Barber.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? BarberData.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  BarberData? _data;

  Barber copyWith({
    bool? status,
    String? message,
    BarberData? data,
  }) =>
      Barber(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  BarberData? get data => _data;

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

class BarberData {
  BarberData({
    num? id,
    num? bookingsCount,
    num? salonId,
    num? isDeleted,
    num? status,
    num? rating,
    String? photo,
    String? name,
    String? phone,
    String? password,
    num? gender,
    String? createdAt,
    String? updatedAt,
    SalonData? salon,
  }) {
    _id = id;
    _bookingsCount = bookingsCount;
    _salonId = salonId;
    _isDeleted = isDeleted;
    _status = status;
    _rating = rating;
    _photo = photo;
    _name = name;
    _phone = phone;
    _password = password;
    _gender = gender;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _salon = salon;
  }

  BarberData.fromJson(dynamic json) {
    _id = json['id'];
    _bookingsCount = json['bookings_count'];
    _salonId = json['salon_id'];
    _isDeleted = json['is_deleted'];
    _status = json['status'];
    _rating = json['rating'];
    _photo = json['photo'];
    _name = json['name'];
    _phone = json['phone'];
    _password = json['password'];
    _gender = json['gender'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _salon = json['salon'] != null ? SalonData.fromJson(json['salon']) : null;
  }

  num? _id;
  num? _bookingsCount;
  num? _salonId;
  num? _isDeleted;
  num? _status;
  num? _rating;
  String? _photo;
  String? _name;
  String? _phone;
  String? _password;
  num? _gender;
  String? _createdAt;
  String? _updatedAt;
  SalonData? _salon;

  BarberData copyWith({
    num? id,
    num? bookingsCount,
    num? salonId,
    num? isDeleted,
    num? status,
    num? rating,
    String? photo,
    String? name,
    String? phone,
    String? password,
    num? gender,
    String? createdAt,
    String? updatedAt,
    SalonData? salon,
  }) =>
      BarberData(
        id: id ?? _id,
        bookingsCount: bookingsCount ?? _bookingsCount,
        salonId: salonId ?? _salonId,
        isDeleted: isDeleted ?? _isDeleted,
        status: status ?? _status,
        rating: rating ?? _rating,
        photo: photo ?? _photo,
        name: name ?? _name,
        phone: phone ?? _phone,
        password: password ?? _password,
        gender: gender ?? _gender,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        salon: salon ?? _salon,
      );

  num? get id => _id;

  num? get bookingsCount => _bookingsCount;

  num? get salonId => _salonId;

  num? get isDeleted => _isDeleted;

  num? get status => _status;

  num? get rating => _rating;

  String? get photo => _photo;

  String? get name => _name;

  String? get phone => _phone;

  String? get password => _password;

  num? get gender => _gender;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  SalonData? get salon => _salon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bookings_count'] = _bookingsCount;
    map['salon_id'] = _salonId;
    map['is_deleted'] = _isDeleted;
    map['status'] = _status;
    map['rating'] = _rating;
    map['photo'] = _photo;
    map['name'] = _name;
    map['phone'] = _phone;
    map['password'] = _password;
    map['gender'] = _gender;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['salon'] = _salon;
    return map;
  }
}

class SalonData {
  num? _id;
  num? _wallet;
  num? _lifetimeEarnings;
  num? _deviceType;
  num? _status;
  num? _topRated;
  num? _isNotification;
  num? _onVacation;
  num? _isServeOutside;
  num? _isPayAfterService;
  num? _rating;
  num? _reviewsCount;
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

  SalonData({
    num? id,
    num? wallet,
    num? lifetimeEarnings,
    num? deviceType,
    num? status,
    num? topRated,
    num? isNotification,
    num? onVacation,
    num? isServeOutside,
    num? isPayAfterService,
    num? rating,
    num? reviewsCount,
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
    _isServeOutside = isServeOutside;
    _isPayAfterService = isPayAfterService;
    _rating = rating;
    _reviewsCount = reviewsCount;
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

  SalonData.fromJson(dynamic json) {
    _id = json['id'];
    _wallet = json['wallet'];
    _lifetimeEarnings = json['lifetime_earnings'];
    _deviceType = json['device_type'];
    _status = json['status'];
    _topRated = json['top_rated'];
    _isNotification = json['is_notification'];
    _onVacation = json['on_vacation'];
    _isServeOutside = json['is_serve_outside'];
    _isPayAfterService = json['is_pay_after_service'];
    _rating = json['rating'];
    _reviewsCount = json['reviews_count'];
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

  SalonData copyWith({
    num? id,
    num? wallet,
    num? lifetimeEarnings,
    num? deviceType,
    num? status,
    num? topRated,
    num? isNotification,
    num? onVacation,
    num? isServeOutside,
    num? isPayAfterService,
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
      SalonData(
        id: id ?? _id,
        wallet: wallet ?? _wallet,
        lifetimeEarnings: lifetimeEarnings ?? _lifetimeEarnings,
        deviceType: deviceType ?? _deviceType,
        status: status ?? _status,
        topRated: topRated ?? _topRated,
        isNotification: isNotification ?? _isNotification,
        onVacation: onVacation ?? _onVacation,
        isServeOutside: isServeOutside ?? _isServeOutside,
        isPayAfterService: isPayAfterService ?? _isPayAfterService,
        rating: rating ?? _rating,
        reviewsCount: reviewsCount ?? _reviewsCount,
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

  num? get isServeOutside => _isServeOutside;

  num? get isPayAfterService => _isPayAfterService;

  num? get rating => _rating;

  num? get reviewsCount => _reviewsCount;

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
    map['is_serve_outside'] = _isServeOutside;
    map['is_pay_after_service'] = _isPayAfterService;
    map['rating'] = _rating;
    map['reviews_count'] = _reviewsCount;
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
