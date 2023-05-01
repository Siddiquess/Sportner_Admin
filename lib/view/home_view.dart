import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/home_view_components/userlist_components.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/utils/global_values.dart';
import 'package:sportner_admin/view_model/login_view_model.dart';
import '../components/home_view_components/vendor_list_componentsl.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // final userViewModel = context.watch<UserDataViewModel>();
    // final vendorViewModel = context.watch<VendorDataViewModel>();
    return Scaffold(
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
          IconButton(
            onPressed: () {
              context.read<LoginViewModel>().setLogout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            UserListComponents(),
            AppSizes.kHeight30,
            VendorListComponents(),
          ],
        ),
      ),
    );
  }
}
