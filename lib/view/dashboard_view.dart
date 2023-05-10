import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/dashboard_components/dashboard_loading_widget.dart';
import 'package:sportner_admin/components/error_widget.dart';
import 'package:sportner_admin/view_model/dashboard_view_model.dart';

import '../components/dashboard_components/sport_pei_chart.dart';
import '../components/dashboard_components/top_grid.dart';
import '../utils/global_colors.dart';
import '../utils/global_values.dart';
import '../utils/text_styles.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashViewModel = context.watch<DashBoardViewModel>();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.appColor,
              Color.fromARGB(202, 103, 211, 151),
              Color.fromARGB(255, 168, 214, 189),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: SafeArea(
          child: dashViewModel.isLoading
              ? const DashBoardLoadingWidget()
              : dashViewModel.errorCode == 404
                  ? const NoInternetWidget()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: dashViewModel.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppSizes.kHeight20,
                                  Text(
                                    "Dashboard",
                                    style: AppTextStyles.textH1White,
                                  ),
                                  AppSizes.kHeight20,
                                  TopGrid(
                                      dashboardData:
                                          dashViewModel.dashBoardData!),
                                  AppSizes.kHeight20,
                                  BottomGrid(
                                      dashboardData:
                                          dashViewModel.dashBoardData),
                                  AppSizes.kHeight20,
                                  SportsDataChart(),
                                ],
                              ),
                            ),
                    ),
        ),
      ),
    );
  }
}
