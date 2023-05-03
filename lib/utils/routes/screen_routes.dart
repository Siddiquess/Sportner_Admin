import 'package:flutter/material.dart';
import 'package:sportner_admin/view/admin_login_view.dart';
import '../../view/bottom_nav_view.dart';
import '../../view/home_view.dart';
import '../../view/splash_screen_view.dart';

class ScreenRoutes {
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/adminLoginScreen";
  static const splashScreen = "/splashScreen";
  static const mainScreen = "/mainScreen";

  static Map<String, Widget Function(BuildContext)> routes = {
    "/splashScreen": (context) => const SplashScreen(),
    "/adminLoginScreen": (context) => const AdminLoginScreen(),
    "/homeScreen": (context) => const HomeScreenView(),
    "/mainScreen": (context) => BottomNavView(),
  };
}
