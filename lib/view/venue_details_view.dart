import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/utils/global_values.dart';
import 'package:sportner_admin/utils/text_styles.dart';
import 'package:sportner_admin/view_model/venue_list_view_model.dart';

class VenueDetailsView extends StatelessWidget {
  final int index;
  const VenueDetailsView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final venueDataList = context.watch<VenueDataViewModel>().venueDataList;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        centerTitle: true,
        title:  Text("Venue Details",style: AppTextStyles.textH2,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                AppSizes.kHeight10,
                Container(
                  height: size.height * 0.20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(venueDataList[index].image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
