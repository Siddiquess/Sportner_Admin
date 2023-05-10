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

  TextEditingController reasonController = TextEditingController();
  VendorDataModel? _vendorDataModel;
  int? _errorCode;
  List<VmsData> _vendorDataList = [];
  bool _isLoading = false;

  VendorDataModel? get vendorDataModel => _vendorDataModel;
  List<VmsData> get vendorDataList => _vendorDataList;
  int? get errorCode => _errorCode;
  bool get isLoading => _isLoading;

  notifyListen() {
    notifyListeners();
  }

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
      setError(response);
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

  getVendorApprovalStatus({
    required String vendorId,
    required String status,
  }) async {
    final accessToken = await getAccessToken();

    final response = await ApiServices.putMethod(
      url: Urls.kVendorStatus,
      body: {
        "vmId": vendorId,
        "status": status,
        "reason": reasonController.text
      },
      headers: {"Authorization": accessToken!},
    );
    if (response is Success) {
      log("Vendor accept reject success");
      _setVendorApprovalStatus(vendorId, status);
      clearReasonController();
    }
    if (response is Failure) {
      log("VendorBlock accept reject  failed");
    }
    notifyListeners();
  }

  clearReasonController() {
    reasonController.clear();
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

  setError(Failure error) {
    _errorCode = error.code;
    notifyListen();
  }

  setVendorBlock(String vendorId) {
    if (_vendorDataList.any((data) => data.id == vendorId)) {
      final index = _vendorDataList
          .indexWhere((vendorIndex) => vendorIndex.id == vendorId);
      _vendorDataList[index].blockStatus = !_vendorDataList[index].blockStatus!;
      notifyListeners();
    }
  }

  _setVendorApprovalStatus(String vendorId, String status) {
    if (_vendorDataList.any((data) => data.id == vendorId)) {
      final index = _vendorDataList
          .indexWhere((vendorIndex) => vendorIndex.id == vendorId);
      _vendorDataList[index].status = status;
      notifyListeners();
    }
  }

  setVendorLoading(bool loading) {
    _isLoading = loading;
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
