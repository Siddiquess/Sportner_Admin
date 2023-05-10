import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportner_admin/utils/global_values.dart';
import '../shimmer_widget.dart';

class VenueLoadingWidget extends StatelessWidget {
  const VenueLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSizes.kHeight20,
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppSizes.kHeight10,
            itemBuilder: (BuildContext context, int index) {
              return ShimmerWidget(
                height: 90.h,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlankContainer(
                        height: 70,
                        width: 70.w,
                      ),
                      BlankContainer(
                        height: 10,
                        width: 80.w,
                        radius: 0,
                      ),
                      BlankContainer(
                        height: 20.h,
                        width: 65.w,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
