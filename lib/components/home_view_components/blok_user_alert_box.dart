import 'package:flutter/material.dart';
import 'package:sportner_admin/model/vendor_data_model.dart';
import 'package:sportner_admin/utils/global_colors.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import '../../model/user_data_model.dart';
import '../../utils/text_styles.dart';
import '../../view_model/user_data_view_model.dart';

class BlockAlertBox {
  static alertBox({
    required BuildContext context,
    required bool blockStatus,
    UserDataViewModel? usersViewModel,
    VendorDataViewModel? vendorsViewModel,
    UserData? userData,
    VmsData? vendorData,
    bool? isUser = true,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final title = isUser == true ? "User" : "Vendor";
        final blockText = blockStatus ? "Unblock" : "Block";
        return AlertDialog(
          icon: const Icon(
            Icons.info_outline,
            size: 100,
            weight: 1,
            fill: 1,
            color: AppColors.lightred,
          ),
          title: Text('$blockText $title!'),
          content: Text(
            'Are you sure you want to ${blockText.toLowerCase()} the ${title.toLowerCase()}?',
            style: AppTextStyles.textH4,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                elevation: 0,
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (isUser == true) {
                  usersViewModel?.getUserBlockStatus(
                    userId: userData!.id!,
                  );
                } else {
                  vendorsViewModel?.getVendorBlockStatus(
                    vendorId: vendorData!.id!,
                  );
                }

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blockStatus ? AppColors.green : AppColors.red,
                elevation: 0,
              ),
              child: Text(blockText),
            ),
          ],
        );
      },
    );
  }
}
