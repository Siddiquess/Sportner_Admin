import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/venue_data_model.dart';
import '../repository/api_status.dart';
import '../repository/services.dart';
import '../utils/constants.dart';
import '../utils/global_keys.dart';

class VenueDataViewModel with ChangeNotifier{

  VenueDataViewModel() {
    getVenueDataModel();
  }

  VenueDataModel? _venueDataModel;
  List<Response> _venueDataList = [];
  bool _isVenueDataLoading = false;

  VenueDataModel? get venueDataModel => _venueDataModel;
  List<Response> get venueDataList => _venueDataList;
  bool get isVenueLoading => _isVenueDataLoading;

  getVenueDataModel() async {
    setVenueLoading(true);

    final accessToken = await getAccessToken();

    final response = await ApiServices.getMethod(
      url: Urls.kGetVenueData,
      headers: {"Authorization": accessToken!},
      jsonDecod: venueDataModelFromJson,
    );

    if (response is Success) {
      log("Venuedata response success");
      setVenueLoading(false);
      await setVenueDataModel(response.response as VenueDataModel);
    }

    if (response is Failure) {
      setVenueLoading(false);
      log("Venue Data failed");
    }
  }

  getVenueBlockStatus({required String venueId}) async {
    final accessToken = await getAccessToken();

    final response = await ApiServices.putMethod(
      url: Urls.kBlockVenue,
      body: {"id": venueId},
      headers: {"Authorization": accessToken!},
    );
    if (response is Success) {
      log("Venue Blocked");
      setVenueBlock(venueId);
    }
    if (response is Failure) {
      log("VenueBlock failed");
    }
    notifyListeners();
  }

  setVenueDataModel(VenueDataModel venueData) {
    _venueDataModel = venueData;
    if (_venueDataModel != null) {
      setVenueDataList(_venueDataModel!.response as List<Response>);
    }
    notifyListeners();
  }

  setVenueDataList(List<Response> venueList) {
    _venueDataList = venueList;
    notifyListeners();
  }

  setVenueBlock(String venueId) {
    if (_venueDataList.any((data) => data.id == venueId)) {
      final index =
          _venueDataList.indexWhere((venueIndex) => venueIndex.id == venueId);
      _venueDataList[index].isBlocked = !_venueDataList[index].isBlocked!;
      notifyListeners();
    }
  }

  setVenueLoading(bool loading) {
    _isVenueDataLoading = loading;
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }

}