import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/home_view_components/userlist_components.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/view_model/login_view_model.dart';
import '../components/home_view_components/vendor_list_componentsl.dart';
import '../components/normal_alert_box.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.lightgrey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Admin",
            style: TextStyle(color: AppColors.white),
          ),
          elevation: 2,
          backgroundColor: AppColors.appColor,
          actions: [
            _logOutButton(context),
          ],
          toolbarHeight: 30,
          bottom: TabBar(
              indicatorColor: AppColors.white,
              unselectedLabelColor: AppColors.lightgrey,
              tabs: [
                _userTabBar(),
                _vendorTabBar(),
              ]),
        ),
        body: const TabBarView(
          children: [
            UserListComponents(),
            VendorListComponents(),
          ],
        ),
      ),
    );
  }

  IconButton _logOutButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        NormalAlertBox.alertBox(
          context: context,
          title: "Logout!",
          content: "Are you sure you want to logout?",
          onPressed: () {
            context.read<LoginViewModel>().setLogout(context);
          },
        );
      },
      icon: const Icon(
        Icons.logout,
        color: AppColors.white,
      ),
    );
  }

  Tab _vendorTabBar() {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.group,
            color: AppColors.white,
          ),
          Text(
            "Vendors",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Tab _userTabBar() {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.group,
            color: AppColors.white,
          ),
          Text(
            "Users",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
