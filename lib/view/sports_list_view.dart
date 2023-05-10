import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/error_widget.dart';
import 'package:sportner_admin/components/sports_view_components.dart/sports_loading_widget.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/utils/text_styles.dart';
import 'package:sportner_admin/view_model/sport_data_view_model.dart';
import '../components/sports_view_components.dart/sport_data_container.dart';
import '../utils/global_values.dart';

class SportsListView extends StatelessWidget {
  const SportsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        title: const Text(
          "Sports",
          style: TextStyle(color: AppColors.white),
        ),
        elevation: 1,
        backgroundColor: AppColors.appColor,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: AppColors.appColor,
        onRefresh: () async {
          await context.read<SportsDataViewModel>().getSportsDataModel();
        },
        child: Consumer<SportsDataViewModel>(
          builder: (context, sportViewModel, child) {
            return sportViewModel.isLoading
                ? const SportsLoadingWidget()
                : sportViewModel.errorCode == 404
                    ? const NoInternetWidget()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              AppSizes.kHeight20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sport", style: AppTextStyles.textH4),
                                  Text("Logo", style: AppTextStyles.textH4),
                                  Text("Facility", style: AppTextStyles.textH4)
                                ],
                              ),
                              const Divider(thickness: 1.5),
                              AppSizes.kHeight5,
                              const SportDataContainerWidget(),
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
