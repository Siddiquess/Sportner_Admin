import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/sports_data_model.dart';
import '../repository/api_status.dart';
import '../repository/services.dart';
import '../utils/constants.dart';
import '../utils/global_keys.dart';

class SportsDataViewModel with ChangeNotifier {
  SportsDataViewModel() {
    getSportsDataModel();
  }

  SportsDataModel? _sportsDataModel;
  List<SportsData> _sportsDataList = [];
  int? _errorCode;
  bool _isLoading = false;

  SportsDataModel? get sportsDataModel => _sportsDataModel;
  List<SportsData> get sportsDataList => _sportsDataList;
  int? get errorCode => _errorCode;
  bool get isLoading => _isLoading;

  getSportsDataModel() async {
    _setSportsLoading(true);

    final accessToken = await getAccessToken();

    final response = await ApiServices.getMethod(
      url: Urls.kGetSportsData,
      headers: {"Authorization": accessToken!},
      jsonDecod: sportsDataModelFromJson,
    );

    if (response is Success) {
      log("Sportsdata response success");
      _setSportsLoading(false);
      await _setSportsDataModel(response.response as SportsDataModel);
    }

    if (response is Failure) {
      _setSportsLoading(false);
      setError(response);
      log("Sports Data failed");
    }
  }

  getSportsBlockStatus({
    required String sportsId,
    required String facilityId,
    required String facility,
    required bool status,
  }) async {
    final accessToken = await getAccessToken();

    final response = await ApiServices.putMethod(
      url: Urls.kBlockSports,
      body: getSportBlockBody(
        id: sportsId,
        facility: facility,
        status: status,
      ),
      headers: {"Authorization": accessToken!},
    );
    if (response is Success) {
      log("Sports Blocked");
      _setSportsBlock(
        sportsId: sportsId,
        facilityId: facilityId,
        facilityName: facility,
        status: status,
      );
    }
    if (response is Failure) {
      log("SportsBlock failed");
    }
    notifyListeners();
  }

  _setSportsDataModel(SportsDataModel sportsData) {
    _sportsDataModel = sportsData;
    if (_sportsDataModel != null) {
      setSportsDataList(_sportsDataModel!.sportsDatas as List<SportsData>);
    }
    notifyListeners();
  }

  setSportsDataList(List<SportsData> sportsList) {
    _sportsDataList = sportsList;
    notifyListeners();
  }

  setError(Failure error) {
    _errorCode = error.code;
    notifyListeners();
  }

  _setSportsBlock({
    required String sportsId,
    required String facilityId,
    required String facilityName,
    required bool status,
  }) {
    if (_sportsDataList.any((data) => data.id == sportsId)) {
      final sportIndex =
          _sportsDataList.indexWhere((sport) => sport.id == sportsId);

      if (_sportsDataList[sportIndex]
          .facilityDetails!
          .any((facility) => facility.id == facilityId)) {
        final facilityIndex = _sportsDataList[sportIndex]
            .facilityDetails!
            .indexWhere((facility) => facility.id == facilityId);

        _sportsDataList[sportIndex].facilityDetails![facilityIndex].status =
            status;
        notifyListeners();
      }
    }
  }

  Map getSportBlockBody({
    required String id,
    required String facility,
    required bool status,
  }) {
    final body = SportStatusModel(
      id: id,
      facility: facility,
      status: status,
    );

    return body.toJson();
  }

  _setSportsLoading(bool loading) {
    _isLoading = loading;
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
