import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/bookings_component/bookings_card.dart';

import '../components/error_widget.dart';
import '../utils/global_colors.dart';
import '../utils/global_values.dart';
import '../view_model/bookings_view_model.dart';

class BookingsScreenView extends StatelessWidget {
  const BookingsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingViewModel = context.watch<BookingViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        title: const Text(
          "Bookings",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => bookingViewModel.getBookingDatas(),
        child: Container(
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
          child: bookingViewModel.errorCode == 404
              ? const NoInternetWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView(
                    children: [
                      AppSizes.kHeight10,
                      BookingCard(
                        bookingDataList: bookingViewModel.bookingDataList,
                      ),
                      AppSizes.kHeight30,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
