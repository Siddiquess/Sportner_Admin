import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/utils/text_styles.dart';
import 'package:sportner_admin/view_model/vendor_data_view_model.dart';
import '../../utils/global_colors.dart';

class VenorRejectBox {
  static alertBox({
    required BuildContext context,
    required GestureTapCallback rejectButton,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure you want to reject the venue manager ?',
            style: AppTextStyles.textH4,
          ),
          content: TextFormField(
            onChanged: (value) {
              context.read<VendorDataViewModel>().notifyListen();
            },
            controller: context.watch<VendorDataViewModel>().reasonController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Reason for rejection"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<VendorDataViewModel>().clearReasonController();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                elevation: 0,
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: context
                      .watch<VendorDataViewModel>()
                      .reasonController
                      .text
                      .isEmpty
                  ? null
                  : rejectButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                disabledBackgroundColor: AppColors.lightgrey,
                elevation: 0,
              ),
              child: const Text("Reject"),
            ),
          ],
        );
      },
    );
  }
}
