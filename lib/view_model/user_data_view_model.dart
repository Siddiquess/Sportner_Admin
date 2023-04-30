import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportner_admin/model/user_data_model.dart';
import 'package:sportner_admin/repository/api_status.dart';
import 'package:sportner_admin/repository/services.dart';
import 'package:sportner_admin/utils/constants.dart';
import '../utils/global_keys.dart';

class UserDataViewModel with ChangeNotifier {
  UserDataViewModel() {
    getUserDataModel();
  }

  UserDataModel? _userDataModel;
  List<UserData> _userDataList = [];
  bool _isUserDataLoading = false;

  UserDataModel? get userDataModel => _userDataModel;
  List<UserData> get userDataList => _userDataList;
  bool get isUserLoading => _isUserDataLoading;

  getUserDataModel() async {
    setUserLoading(true);

    final accessToken = await getAccessToken();

    final response = await ApiServices.getMethod(
      url: Urls.kGetUserData,
      headers: {"Authorization": accessToken!},
      jsonDecod: userDataModelFromJson,
    );

    if (response is Success) {
      log("userdata response success");
      setUserLoading(false);
      await setUserDataModel(response.response as UserDataModel);
    }

    if (response is Failure) {
      setUserLoading(false);
      log("User Data failed");
    }
  }

  getUserBlockStatus({required String userId}) async {
    final accessToken = await getAccessToken();

    final response = await ApiServices.putMethod(
      url: Urls.kBlockUsers,
      body: {"_id": userId},
      headers: {"Authorization": accessToken!},
    );
    if (response is Success) {
      log("User Blocked");
      setUserBlock(userId);
    }
    if (response is Failure) {
      log("userBlock failed");
    }
    notifyListeners();
  }

  setUserDataModel(UserDataModel userData) {
    _userDataModel = userData;
    if (_userDataModel != null) {
      setUserDataList(_userDataModel!.userDatas as List<UserData>);
    }
    notifyListeners();
  }

  setUserDataList(List<UserData> userList) {
    _userDataList = userList;
    notifyListeners();
  }

  setUserBlock(String userId) {
    if (_userDataList.any((data) => data.id == userId)) {
      final index =
          _userDataList.indexWhere((userIndex) => userIndex.id == userId);
      _userDataList[index].blockStatus = !_userDataList[index].blockStatus!;
      notifyListeners();
    }
  }

  setUserLoading(bool loading) {
    _isUserDataLoading = loading;
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
