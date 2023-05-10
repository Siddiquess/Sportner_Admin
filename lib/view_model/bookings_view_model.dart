import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/booking_data_model.dart';
import '../repository/api_status.dart';
import '../repository/services.dart';
import '../utils/constants.dart';
import '../utils/global_keys.dart';

class BookingViewModel with ChangeNotifier {
  BookingViewModel() {
    getBookingDatas();
  }

  List<BookingDataModel> _bookingDataList = [];
  int? _errorCode;
  bool _isLoading = false;

  List<BookingDataModel> get bookingDataList => _bookingDataList;
  bool get isLoading => _isLoading;
  int? get errorCode => _errorCode;

  getBookingDatas() async {
    setLoading(true);
    final accessToken = await getAccessToken();
    final response = await ApiServices.getMethod(
      url: Urls.kGetAllBookings,
      jsonDecod: bookingDataModelFromJson,
      headers: {"Authorization": accessToken!},
    );

    if (response is Success) {
      setLoading(false);
      log("success");
      setBookingDatas(response.response as List<BookingDataModel>);
    }

    if (response is Failure) {
      log("failed");
      setLoading(false);

      setErrorResponse(response);
    }
  }

  setBookingDatas(List<BookingDataModel> bookingDataList) {
    _bookingDataList = bookingDataList;
    notifyListeners();
  }

  setErrorResponse(Failure errorResp) {
    _errorCode = errorResp.code;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Convert to 12 hours
  String convertTo12HourFormat(String time24) {
    if (time24 == "HH:MM") {
      return time24;
    }
    DateTime time = DateFormat('HH:mm').parse(time24);

    String time12 = DateFormat('h:mm a').format(time);

    return time12;
  }

  bool isBookingExpired(BookingDataModel bookedVenue) {
    final formatedDate = DateFormat('d,MMM,y').parse(bookedVenue.slotDate!);
    final parsedTimeOnly =
        DateFormat('HH:mm').parse(bookedVenue.slotTime!.split("-").first);

    final parsedDateTime = DateTime(
      formatedDate.year,
      formatedDate.month,
      formatedDate.day,
      parsedTimeOnly.hour,
      parsedTimeOnly.minute,
    );

    if (parsedDateTime.isBefore(DateTime.now())) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getAccessToken() async {
    final sharedpref = await SharedPreferences.getInstance();
    final accessToken = sharedpref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
