import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/global_colors.dart';
import '../view_model/bottom_nav_view_model.dart';
import 'bookings_view.dart';
import 'dashboard_view.dart';
import 'home_view.dart';
import 'sports_list_view.dart';
import 'venue_list_view.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({super.key});

  final List views = [
    const HomeScreenView(),
    const SportsListView(),
    const VenueListView(),
    const BookingsScreenView(),
    const DashBoardView(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    final bottomBarVieModel = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: views[bottomBarVieModel.bottomBarIndex],
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomBarVieModel.bottomOnChanged,
        currentIndex: bottomBarVieModel.bottomBarIndex,
        iconSize: 24,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: AppColors.white,
        elevation: 5,
        selectedItemColor: AppColors.appColor,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "users",
            icon: Icon(
              Icons.group,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            icon: Icon(
              Icons.sports,
            ),
          ),
          BottomNavigationBarItem(
            label: "Venue",
            icon: Icon(CupertinoIcons.sportscourt),
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            icon:  Icon(Icons.confirmation_num_outlined),
          ),
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(
              Icons.donut_small_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
