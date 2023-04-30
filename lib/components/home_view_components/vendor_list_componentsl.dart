import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class VendorListComponents extends StatelessWidget {
  const VendorListComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.group),
                Text(
                  "Vendors",
                  style: AppTextStyles.textH2,
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View all"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Name", style: AppTextStyles.textH4),
            Text("Mobile", style: AppTextStyles.textH4),
            Text("Status", style: AppTextStyles.textH4)
          ],
        ),
        const Divider(thickness: 1.5),
        AppSizes.kHeight5,
        const VendorListWidget()
      ],
    );
  }
}

class VendorListWidget extends StatelessWidget {
  const VendorListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vendorViewModel = context.watch<VendorDataViewModel>();
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final vendorData = vendorViewModel.vendorDataList[index];
        return Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("${vendorData.name}"),
                ),
                Expanded(
                  flex: 3,
                  child: Text(vendorData.mobile ?? "No mobile"),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      vendorViewModel.getVendorBlockStatus(
                        vendorId: vendorData.id!,
                      );
                    },
                    splashRadius: 5,
                    icon: Icon(Icons.person,
                        color: vendorData.blockStatus!
                            ? Colors.red
                            : Colors.green),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => AppSizes.kHeight10,
      itemCount: 4,
    );
  }
}
