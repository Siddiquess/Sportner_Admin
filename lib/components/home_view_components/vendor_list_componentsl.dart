import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/glass_snack_bar.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          AppSizes.kHeight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name", style: AppTextStyles.textH4),
                Text("Mobile", style: AppTextStyles.textH4),
                Text("Status", style: AppTextStyles.textH4)
              ],
            ),
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
      ),
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
        vendorData: vendorData,
        vmAcceptButton: () {
          AlertBoxWidget.alertBox(
            context: context,
            blockButton: () {
              vendorViewModel.getVendorAprrovalStatus(
                vendorId: vendorData.id!,
                status: "approved",
              );
              Navigator.pop(context);
            },
            blockStatus: true,
            title: "Vendor",
            blockText: "Accept",
          );
        },
        blockButton: () {
          AlertBoxWidget.alertBox(
            context: context,
            blockButton: () {
              vendorViewModel.getVendorBlockStatus(
                vendorId: vendorData.id!,
              );
              GlassSnackBar.snackBar(
                context: context,
                color:
                    vendorData.blockStatus! ? Colors.green : Colors.redAccent,
                title: vendorData.blockStatus!
                    ? "Unblocked Vendor!"
                    : "Blocked Vendor!",
                subtitle:
                    "Vendor ${vendorData.blockStatus! ? "Unblocked" : "Blocked"} Successfully!",
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
