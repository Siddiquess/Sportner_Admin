import 'dart:developer';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/global_keys.dart';
import 'admin_login_view.dart';
import 'bottom_nav_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          log(snapshot.data.toString());
          return AnimatedSplashScreen(
            splashIconSize: double.infinity,
            splash: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  "assets/LOGO.svg",
                ),
              ),
            ),
            nextScreen: snapshot.data!,
          );
        },
      ),
    );
  }
}

Future<Widget> loginStatus() async {
  final status = await SharedPreferences.getInstance();
  final adminLoggedIn = status.getBool(GlobalKeys.adminLoggedIn); 
  if (adminLoggedIn == false || adminLoggedIn == null) {
    return const AdminLoginScreen();
  }
  return  BottomNavView();
}
