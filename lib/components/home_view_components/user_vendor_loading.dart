import 'package:flutter/material.dart';
import 'package:sportner_admin/components/shimmer_widget.dart';
import 'package:sportner_admin/utils/global_values.dart';

class UserVendorLoading extends StatelessWidget {
  const UserVendorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSizes.kHeight20,
          ListView.separated(
            itemCount: 6,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                AppSizes.kHeight10,
            itemBuilder: (BuildContext context, int index) {
              return  ShimmerWidget(
                height: 45,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BlankContainer(height: 15, width: 150,radius: 0,),
                      BlankContainer(height: 30, width: 30,),
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
