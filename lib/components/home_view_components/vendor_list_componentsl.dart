import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/home_view_components/user_vendor_list.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class VendorListComponents extends StatelessWidget {
  const VendorListComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vendorViewModel = context.watch<VendorDataViewModel>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.group),
                Text("Vendors", style: AppTextStyles.textH2),
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(44, 158, 158, 158),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _vendorListWidget(vendorViewModel: vendorViewModel),
          ),
        )
      ],
    );
  }
}

_vendorListWidget({required VendorDataViewModel vendorViewModel}) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemCount: vendorViewModel.vendorDataList.length,
    separatorBuilder: (context, index) => AppSizes.kHeight10,
    itemBuilder: (context, index) {
      final vendorData = vendorViewModel.vendorDataList[index];
      return UserVendorListWidget(
        name: vendorData.name!,
        mobile: vendorData.mobile ?? "No mobile",
        blockStatus: vendorData.blockStatus!,
        onTap: () {},
        blockButton: () {
          AlertBoxWidget.alertBox(
            context: context,
            blockButton: () {
              vendorViewModel.getVendorBlockStatus(
                vendorId: vendorData.id!,
              );
              Navigator.pop(context);
            },
            blockStatus: vendorData.blockStatus!,
            title: "Vendor",
            blockText: vendorData.blockStatus! ? "Unblock" : "Block",
          );
        },
      );
    },
  );
}
