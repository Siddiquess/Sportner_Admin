import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportner_admin/model/vendor_data_model.dart';
import 'package:sportner_admin/repository/services.dart';
import 'package:sportner_admin/utils/constants.dart';
import '../repository/api_status.dart';
import '../utils/global_keys.dart';

class VendorDataViewModel with ChangeNotifier {
  VendorDataViewModel() {
    getVendorDataModel();
  }

  VendorDataModel? _vendorDataModel;
  List<VmsData> _vendorDataList = [];
  bool _isVendorDataLoading = false;

  VendorDataModel? get vendorDataModel => _vendorDataModel;
  List<VmsData> get vendorDataList => _vendorDataList;
  bool get isVendorLoading => _isVendorDataLoading;

  getVendorDataModel() async {
    setVendorLoading(true);

    final accessToken = await getAccessToken();

    final response = await ApiServices.getMethod(
      url: Urls.kGetVendorData,
      headers: {"Authorization": accessToken!},
      jsonDecod: vendorDataModelFromJson,
    );

    if (response is Success) {
      log("Vendordata response success");
      setVendorLoading(false);
      await setVendorDataModel(response.response as VendorDataModel);
    }

    if (response is Failure) {
      setVendorLoading(false);
      log("Vendor Data failed");
    }
  }

  getVendorBlockStatus({required String vendorId}) async {
    final accessToken = await getAccessToken();

    final response = await ApiServices.putMethod(
      url: Urls.kBlockVendors,
      body: {"_id": vendorId},
      headers: {"Authorization": accessToken!},
    );
    if (response is Success) {
      log("Vendor Blocked");
      setVendorBlock(vendorId);
    }
    if (response is Failure) {
      log("VendorBlock failed");
    }
    notifyListeners();
  }

  setVendorDataModel(VendorDataModel vendorData) {
    _vendorDataModel = vendorData;
    if (_vendorDataModel != null) {
      setVendorDataList(_vendorDataModel!.vmsDatas as List<VmsData>);
    }
    notifyListeners();
  }

  setVendorDataList(List<VmsData> vendorList) {
    _vendorDataList = vendorList;
    notifyListeners();
  }

  setVendorBlock(String vendorId) {
    if (_vendorDataList.any((data) => data.id == vendorId)) {
      final index =
          _vendorDataList.indexWhere((vendorIndex) => vendorIndex.id == vendorId);
      _vendorDataList[index].blockStatus = !_vendorDataList[index].blockStatus!;
      notifyListeners();
    }
  }

  setVendorLoading(bool loading) {
    _isVendorDataLoading = loading;
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
