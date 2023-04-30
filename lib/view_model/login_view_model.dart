import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportner_admin/model/admin_login_model.dart';
import 'package:sportner_admin/model/login_error_model.dart';
import 'package:sportner_admin/repository/api_status.dart';
import 'package:sportner_admin/repository/services.dart';
import 'package:sportner_admin/utils/constants.dart';
import 'package:sportner_admin/utils/routes/screen_routes.dart';

import '../components/snackbar_widget.dart';
import '../utils/global_keys.dart';

class LoginViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isShowPassword = true;
  bool _isLoading = false;
  AdminLoginModel? _adminData;
  LoginError? _loginError;

  bool get isShowPassword => _isShowPassword;
  bool get isLoading => _isLoading;
  AdminLoginModel? get adminData => _adminData;
  LoginError? get loginError => _loginError;

  setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  setLoading(loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<AdminLoginModel?> setAdminData(AdminLoginModel adminData) async {
    _adminData = adminData;
    return _adminData;
  }

  setLoginError(LoginError loginError, BuildContext context) {
    _loginError = loginError;

    return errorResonses(_loginError!, context);
  }

  setAdminLogin(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    final response = await ApiServices.postMethod(
      Urls.kADMINSIGNIN,
      setAdminBody(),
      adminLoginModelFromJson,
    );
    if (response is Success) {
      final data = await setAdminData(response.response as AdminLoginModel);
      String? accesToken = data!.accessToken;
      setLoginStatus(accesToken!);
      clearController();
      setLoading(false);
      navigator.pushReplacementNamed(ScreenRoutes.mainScreen);
    }
    if (response is Failure) {
      await setLoading(false);
      LoginError loginError = LoginError(
        code: response.code,
        message: response.errorResponse,
      );

      await setLoginError(loginError, context);
      clearPassword();
    }
    setLoading(false);
  }

  Map<String, dynamic> setAdminBody() {
    AdminLoginModel data = AdminLoginModel(
      name: nameController.text.trim(),
      password: passwordController.text.trim(),
    );

    return data.toJson();
  }

  setLoginStatus(String accessToken) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool(GlobalKeys.adminLoggedIn, true);
    await status.setString(GlobalKeys.accesToken, accessToken);
  }

  setLogout(context) async {
    final naviagator = Navigator.of(context);
    final status = await SharedPreferences.getInstance();
    status.remove(GlobalKeys.adminLoggedIn);
    status.remove(GlobalKeys.accesToken);
    naviagator.pushNamedAndRemoveUntil(
        ScreenRoutes.loginScreen, (route) => false);
  }

  clearController() {
    nameController.clear();
    passwordController.clear();
  }

  clearPassword() {
    passwordController.clear();
  }

  errorResonses(LoginError loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 401) {
      return SnackBarWidget.snackBar(context, "Invalid username or password");
    }
    return SnackBarWidget.snackBar(context, loginError.message.toString());
  }
}
