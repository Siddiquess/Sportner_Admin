import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/error_widget.dart';
import 'package:sportner_admin/components/venue_list_components/venue_loading_widget.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/view_model/venue_list_view_model.dart';

import '../components/venue_list_components/venue_list_controller.dart';
import '../utils/global_values.dart';
import '../utils/text_styles.dart';

class VenueListView extends StatelessWidget {
  const VenueListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Venues",
          style: TextStyle(color: AppColors.white),
        ),
        elevation: 2,
        backgroundColor: AppColors.appColor,
      ),
      body: RefreshIndicator(
        color: AppColors.appColor,
        onRefresh: () => context.read<VenueDataViewModel>().getVenueDataModel(),
        child: Consumer<VenueDataViewModel>(
          builder: (context, venueViewModel, child) {
            return venueViewModel.isLoading
                ? const VenueLoadingWidget()
                : venueViewModel.errorCode == 404
                    ? const NoInternetWidget()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AppSizes.kHeight20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Venue Name",
                                    style: AppTextStyles.textH4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45),
                                    child: Text(
                                      "Sports",
                                      style: AppTextStyles.textH4,
                                    ),
                                  ),
                                  Text(
                                    "Status",
                                    style: AppTextStyles.textH4,
                                  )
                                ],
                              ),
                              const Divider(thickness: 1.5),
                              AppSizes.kHeight5,
                              const VenueControllerWidget(),
                            ],
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
