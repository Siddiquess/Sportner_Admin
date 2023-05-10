import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/view_model/bookings_view_model.dart';

import '../../model/dashboard_data_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class TopGrid extends StatelessWidget {
  final DashBoardDataModel dashboardData;
  const TopGrid({
    super.key,
    required this.dashboardData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bigContainer(
            title: "Bookings",
            subtitle: " Bookings",
            length: "${dashboardData.bookingsCount!}",
            widget: const Icon(
              Icons.leaderboard_outlined,
              size: 35,
              color: Colors.blue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _smallContainer(
                title: "Users",
                length: dashboardData.usersCount!,
                icons: Icons.group,
              ),
              _smallContainer(
                title: "Vendors",
                length: dashboardData.vmsCount!,
                icons: Icons.group,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomGrid extends StatelessWidget {
  final DashBoardDataModel? dashboardData;

  const BottomGrid({
    super.key,
    required this.dashboardData,
  });

  @override
  Widget build(BuildContext context) {
    final totalEarning = context.watch<BookingViewModel>().totalEarnings;
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _smallContainer(
                title: "Venues",
                length: dashboardData!.turfsCount!,
                icons: Icons.grid_view,
              ),
              _smallContainer(
                title: "Sports",
                length: dashboardData!.sportsCount!,
                icons: Icons.sports_soccer,
              ),
            ],
          ),
          _bigContainer(
            title: "Earnings",
            subtitle: ".0",
            length: "₹$totalEarning",
            widget: const Icon(
              Icons.account_balance_wallet,
              size: 35,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _smallContainer({
  required String title,
  required int length,
  required IconData icons,
}) {
  return Container(
    height: 70,
    width: 190,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icons,
            size: 30,
          ),
          AppSizes.kWidth20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Total $title",
                style: AppTextStyles.textH4grey,
              ),
              Text(
                "$length $title",
                style: AppTextStyles.textH3,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _bigContainer({
  required String title,
  required String subtitle,
  required String length,
  required Widget widget,
}) {
  return Container(
    height: 150,
    width: 130,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget,
          AppSizes.kHeight30,
          Text("Total $title", style: AppTextStyles.textH4grey),
          AppSizes.kHeight10,
          Text("$length$subtitle", style: AppTextStyles.textH3),
        ],
      ),
    ),
  );
}
