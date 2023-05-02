import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/glass_snack_bar.dart';
import 'package:sportner_admin/view/venue_details_view.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';
import '../../view_model/venue_list_view_model.dart';
import 'package:sportner_admin/model/venue_data_model.dart';

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
                    _venueName(venueData),
                    _sportsName(venueData),
                    _venueStatusButtons(venueData, context),
                  ],
                ),
              ),
              _showDetailsButton(context, indexV)
            ],
          ),
        );
      },
    );
  }

  Row _showDetailsButton(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VenueDetailsView(index: index),
              ),
            );
          },
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
    );
  }

  Expanded _venueStatusButtons(Response venueData, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          venueData.approved == true
              ? _blockUnblockButton(context, venueData)
              : _apporoveRejcectButton(context, venueData),
        ],
      ),
    );
  }

  Column _apporoveRejcectButton(BuildContext context, Response venueData) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            AlertBoxWidget.alertBox(
              context: context,
              blockButton: () {
                context
                    .read<VenueDataViewModel>()
                    .getVenueApprovalStatus(venueId: venueData.id!);
                Navigator.pop(context);
                GlassSnackBar.snackBar(
                  context: context,
                  title: "Venue Approved",
                  subtitle: "Venue approved successfully!",
                );
              },
              blockStatus: !venueData.approved!,
              title: "Venue",
              blockText: "Approve",
            );
          },
          child: _buttonContainer(
            text: "Approve",
            color: AppColors.green,
          ),
        ),
        AppSizes.kHeight10,
        InkWell(
          onTap: () {
            AlertBoxWidget.alertBox(
              context: context,
              blockButton: () {
                context
                    .read<VenueDataViewModel>()
                    .getVenueRejectStatus(venueId: venueData.id!);
                Navigator.pop(context);
                GlassSnackBar.snackBar(
                  context: context,
                  color: Colors.redAccent,
                  title: "Venue Rejected",
                  subtitle: "Venue rejected successfully!",
                );
              },
              blockStatus: venueData.isBlocked!,
              title: "Venue",
              blockText: "Reject",
            );
          },
          child: _buttonContainer(
            text: "Reject",
            color: AppColors.red,
          ),
        )
      ],
    );
  }

  Widget _buttonContainer({
    required String text,
    required Color color,
  }) {
    return Container(
      height: 30,
      width: 65,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textH5White,
        ),
      ),
    );
  }

  InkWell _blockUnblockButton(BuildContext context, Response venueData) {
    return InkWell(
      onTap: () {
        AlertBoxWidget.alertBox(
          context: context,
          blockButton: () {
            context
                .read<VenueDataViewModel>()
                .getVenueBlockStatus(venueId: venueData.id!);
            Navigator.pop(context);
            GlassSnackBar.snackBar(
              context: context,
              color: venueData.isBlocked! ? AppColors.green : Colors.redAccent,
              title:
                  "${venueData.isBlocked! ? "Unblocked" : "Blocked"} Venue !",
              subtitle:
                  "${venueData.venueName} ${venueData.isBlocked! ? "Unblocked" : "Blocked"} Successfully !",
            );
          },
          blockStatus: venueData.isBlocked!,
          title: "Venue",
          blockText: venueData.isBlocked! ? "Unblock" : "Block",
        );
      },
      child: _buttonContainer(
        text: venueData.isBlocked! ? "Unblock" : "Block",
        color: venueData.isBlocked! ? AppColors.green : AppColors.red,
      ),
    );
  }

  Expanded _sportsName(Response venueData) {
    return Expanded(
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
    );
  }

  Expanded _venueName(Response venueData) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.lightgrey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  venueData.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppSizes.kHeight10,
            Text(
              venueData.venueName!,
              style: AppTextStyles.textH4,
            ),
          ],
        ),
      ),
    );
  }
}
