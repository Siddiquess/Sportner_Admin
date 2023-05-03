import 'package:flutter/material.dart';
import 'package:sportner_admin/components/venue_details_component/venue_details_body.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/utils/text_styles.dart';

class VenueDetailsView extends StatelessWidget {
  final int index;
  const VenueDetailsView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Venue Details",
          style: AppTextStyles.textH2,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: VenueDetailsBody(index: index)
        ),
      ),
    );
  }
}
