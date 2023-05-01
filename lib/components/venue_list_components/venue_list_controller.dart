import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';
import '../../view_model/venue_list_view_model.dart';

class VenueControllerWidget extends StatelessWidget {
  const VenueControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final venueViewModel = context.watch<VenueDataViewModel>();
    return ListView.separated(
      itemCount: venueViewModel.venueDataList.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (context, index) => AppSizes.kHeight10,
      itemBuilder: (context, indexV) {
        final venueData = venueViewModel.venueDataList[indexV];
        return Container(
          constraints: const BoxConstraints(
            minHeight: 100,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          venueData.venueName!,
                          style: AppTextStyles.textH4,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.separated(
                        itemCount: venueData.sportFacility!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        separatorBuilder: (context, index) => AppSizes.kHeight5,
                        itemBuilder: (context, indexS) {
                          final sportData = venueData.sportFacility![indexS];
                          return Text(
                            "${sportData.sport!} (${sportData.facility})",
                            style: AppTextStyles.textH4,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              AlertBoxWidget.alertBox(
                                context: context,
                                blockButton: () {
                                  context
                                      .read<VenueDataViewModel>()
                                      .getVenueBlockStatus(
                                          venueId: venueData.id!);
                                  Navigator.pop(context);
                                },
                                blockStatus: venueData.isBlocked!,
                                title: "Venue",
                                blockText:
                                    venueData.isBlocked! ? "Unblock" : "Block",
                              );
                            },
                            child: Container(
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                color: venueData.isBlocked!
                                    ? AppColors.green
                                    : AppColors.red,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  venueData.isBlocked! ? "Unblock" : "Block",
                                  style: AppTextStyles.textH5White,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    child: const Text(
                      "See Details ->",
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
