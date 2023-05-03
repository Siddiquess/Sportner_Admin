import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/glass_snack_bar.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';
import '../../view_model/sport_data_view_model.dart';
import '../sports_icon.dart';
import 'package:sportner_admin/model/sports_data_model.dart';

class SportDataContainerWidget extends StatelessWidget {
  const SportDataContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sportViewModel = context.watch<SportsDataViewModel>();

    return ListView.separated(
      itemCount: sportViewModel.sportsDataList.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (context, index) => AppSizes.kHeight10,
      itemBuilder: (BuildContext context, int index) {
        final sportsData = sportViewModel.sportsDataList[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sport(sportsData),
                _sportLogo(sportsData),
                _sportFacility(sportsData)
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _sportFacility(SportsData sportsData) {
    return Expanded(
      flex: 4,
      child: ListView.separated(
        itemCount: sportsData.facilityDetails!.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        separatorBuilder: (context, index) => AppSizes.kHeight5,
        itemBuilder: (context, index) {
          final sportFacility = sportsData.facilityDetails![index];
          return Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.lightgrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        sportFacility.facility!,
                        style: AppTextStyles.textH5,
                      ),
                    ),
                  ),
                  AppSizes.kWidth10,
                  _sportsStatusButton(context, sportsData, sportFacility),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  InkWell _sportsStatusButton(BuildContext context, SportsData sportsData,
      FacilityDetail sportFacility) {
    return InkWell(
      onTap: () {
        AlertBoxWidget.alertBox(
          context: context,
          blockButton: () {
            context.read<SportsDataViewModel>().getSportsBlockStatus(
                  sportsId: sportsData.id!,
                  facilityId: sportFacility.id!,
                  facility: sportFacility.facility!,
                  status: !sportFacility.status!,
                );
            GlassSnackBar.snackBar(
              context: context,
              color: sportFacility.status == true
                  ? Colors.redAccent
                  : AppColors.appColor,
              title:
                  "${sportFacility.status == true ? "Disabled" : "Enabled"} facility !",
              subtitle:
                  "${sportsData.sport} ${sportFacility.facility} ${sportFacility.status == true ? "Disabled" : "Enabled"} Successfully!",
            );
            Navigator.pop(context);
          },
          blockStatus: !sportFacility.status!,
          title: "Facility",
          blockText: sportFacility.status == true ? "Disable" : "Enable",
        );
      },
      child: Container(
        height: 30,
        width: 65,
        decoration: BoxDecoration(
          color: sportFacility.status! ? AppColors.red : AppColors.green,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            sportFacility.status! ? "Disable" : "Enable",
            style: AppTextStyles.textH5White,
          ),
        ),
      ),
    );
  }

  Expanded _sportLogo(SportsData sportsData) {
    return Expanded(
      flex: 1,
      child: Icon(Sports.spots(sport: sportsData.sport.toString())),
    );
  }

  Expanded _sport(SportsData sportsData) {
    return Expanded(
      flex: 4,
      child: Text(
        sportsData.sport.toString(),
        style: AppTextStyles.textH3,
      ),
    );
  }
}
