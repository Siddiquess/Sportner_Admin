import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportner_admin/model/dashboard_data_model.dart';
import '../repository/api_status.dart';
import '../repository/services.dart';
import '../utils/constants.dart';
import '../utils/global_keys.dart';

class DashBoardViewModel with ChangeNotifier {
  DashBoardDataModel? _dashBoardData;
  String? _accessToken;
  bool _isloading = false;

  DashBoardDataModel? get dashBoardData => _dashBoardData;
  bool get isLoading => _isloading;

  getDashBoardtDatas() async {
    setLoading(true);
    _accessToken = await accessToken();
    final response = await ApiServices.getMethod(
        url: Urls.kGetDashboardData,
        jsonDecod: dashBoardDataModelFromJson,
        headers: {"Authorization": _accessToken!});
    if (response is Success) {
      if (response.response != null) {
        await setDashBoardData(response.response as DashBoardDataModel);
        log("Dashboard data Success");
      }
      setLoading(false);
    }
    if (response is Failure) {
      log("Dashboard data Error");
      setLoading(false);
    }
    setLoading(false);
  }

  setDashBoardData(DashBoardDataModel dashBoardData) async {
    _dashBoardData = dashBoardData;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isloading = loading;
    // notifyListeners();
  }

  Future<String?> accessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
