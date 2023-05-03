import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/glass_snack_bar.dart';
import 'package:sportner_admin/components/home_view_components/user_vendor_list.dart';
import 'package:sportner_admin/components/home_view_components/vendor_accept_box.dart';
import 'package:sportner_admin/components/vendor_details_box.dart';
import 'package:sportner_admin/model/vendor_data_model.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';
import 'vendor_reject_box.dart';

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

   _vendorListWidget({required VendorDataViewModel vendorViewModel}) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: vendorViewModel.vendorDataList.length,
      separatorBuilder: (context, index) => AppSizes.kHeight10,
      itemBuilder: (context, index) {
        final vendorData = vendorViewModel.vendorDataList[index];
        var userVendorListWidget = UserVendorListWidget(
          name: vendorData.name!,
          mobile: vendorData.mobile ?? "No mobile",
          blockStatus: vendorData.blockStatus!,
          onTap: () {
            VendorDetailsBox.vendorDetailsBox(
              context: context,
              vendorData2: vendorData,
            );
          },
          vendorData: vendorData,
          vmAcceptButton: () {
            VendorAcceptBox.alertBox(
              context: context,
              acceptButton: _acceptButtonWidget(
                context,
                vendorViewModel,
                vendorData,
              ),
              rejectButton: _rejectButtonWidget(
                context,
                vendorViewModel,
                vendorData,
              ),
            );
          },
          blockButton: _blockButtonWidget(
            context,
            vendorViewModel,
            vendorData,
          ),
        );
        return userVendorListWidget;
      },
    );
  }

  /// ACCEPT VENDOR BUTTON

  Function() _acceptButtonWidget(
    BuildContext context,
    VendorDataViewModel vendorViewModel,
    VmsData vendorData,
  ) {
    return () {
      Navigator.pop(context);
      AlertBoxWidget.alertBox(
        context: context,
        blockButton: () {
          vendorViewModel.getVendorApprovalStatus(
            vendorId: vendorData.id!,
            status: "approved",
          );
          Navigator.pop(context);
          GlassSnackBar.snackBar(
            context: context,
            title: "Vendor approved !",
            subtitle: "Vendor approved successfully!",
          );
        },
        blockStatus: true,
        title: "Vendor",
        blockText: "Accept",
      );
    };
  }

  Function() _rejectButtonWidget(
    BuildContext context,
    VendorDataViewModel vendorViewModel,
    VmsData vendorData,
  ) {
    return () {
      Navigator.pop(context);
      VenorRejectBox.alertBox(
        context: context,
        rejectButton: () {
          Navigator.pop(context);
          vendorViewModel.getVendorApprovalStatus(
              vendorId: vendorData.id!, status: "rejected");
          GlassSnackBar.snackBar(
            context: context,
            title: "Vendor rejected !",
            subtitle: "Vendor rejected successfully!",
          );
        },
      );
    };
  }

  Function() _blockButtonWidget(
    BuildContext context,
    VendorDataViewModel vendorViewModel,
    VmsData vendorData,
  ) {
    return () {
      AlertBoxWidget.alertBox(
        context: context,
        blockButton: () {
          vendorViewModel.getVendorBlockStatus(
            vendorId: vendorData.id!,
          );
          GlassSnackBar.snackBar(
            context: context,
            color: vendorData.blockStatus! ? Colors.green : Colors.redAccent,
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
    };
  }
}
