import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportner_admin/components/shimmer_widget.dart';
import 'package:sportner_admin/utils/global_values.dart';

class SportsLoadingWidget extends StatelessWidget {
  const SportsLoadingWidget({super.key});

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
                        height: 15,
                        width: 110.w,
                        radius: 0,
                      ),
                      BlankContainer(
                        height: 20,
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          BlankContainer(
                            height: 25.h,
                            width: 120.w,
                          ),
                          AppSizes.kHeight10,
                          BlankContainer(
                            height: 25.h,
                            width: 120.w,
                          ),
                        ],
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
