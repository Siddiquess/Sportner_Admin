import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../shimmer_widget.dart';

class DashBoardLoadingWidget extends StatelessWidget {
  const DashBoardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSizes.kHeight20,
          Row(
            children: [
              _shimmerBig(),
              _shimmerSmall(),
            ],
          ),
          AppSizes.kHeight30,
          Row(
            children: [
              
              _shimmerSmall(),
              _shimmerBig(),
            ],
          ),
        ],
      ),
    );
  }

  ShimmerWidget _shimmerSmall() {
    return ShimmerWidget(
              height: 90.h,
              width: 120.w,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlankContainer(
                      height: 40.h,
                      width: 30.w,
                    ),
                    AppSizes.kWidth40,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlankContainer(
                          height: 10,
                          width: 30.w,
                          radius: 0,
                        ),
                        BlankContainer(
                      height: 20.h,
                      width: 25.w,
                    ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            );
  }

  ShimmerWidget _shimmerBig() {
    return ShimmerWidget(
              height: 90.h,
              width: 180.w,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlankContainer(
                      height: 60.h,
                      width: 50.w,
                    ),
                    AppSizes.kWidth40,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlankContainer(
                          height: 10,
                          width: 50.w,
                          radius: 0,
                        ),
                        BlankContainer(
                      height: 20.h,
                      width: 55.w,
                    ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            );
  }
}
