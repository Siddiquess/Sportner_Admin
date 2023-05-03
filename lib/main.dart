import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/view_model/bottom_nav_view_model.dart';
import 'package:sportner_admin/view_model/dashboard_view_model.dart';
import 'package:sportner_admin/view_model/user_data_view_model.dart';
import 'package:sportner_admin/view_model/login_view_model.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import 'utils/global_colors.dart';
import 'utils/routes/screen_routes.dart';
import 'view_model/sport_data_view_model.dart';
import 'view_model/venue_list_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorDataViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SportsDataViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VenueDataViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Sportner Admin',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          // primarySwatch: PrimaryColor.appColor,
          primaryColor: AppColors.appColor,
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                AppColors.appColor,
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: AppColors.black),
            backgroundColor: AppColors.scaffoldColor.withAlpha(2),
            titleTextStyle: const TextStyle(
              color: AppColors.black,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0,
          ),
        ),
        routes: ScreenRoutes.routes,
        initialRoute: "/splashScreen",
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
