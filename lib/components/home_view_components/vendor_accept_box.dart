import 'package:flutter/material.dart';

import '../../utils/global_colors.dart';
import '../../utils/text_styles.dart';

class VendorAcceptBox {

  static alertBox({
    required BuildContext context,
    required GestureTapCallback acceptButton,
    required GestureTapCallback rejectButton,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.info_outline,
            size: 100,
            weight: 1,
            fill: 1,
            color: AppColors.lightgreen,
          ),
          title: const Text('Accept venue manager'),
          content: Text(
            'Do you want to accept or reject the venue manager?',
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
              onPressed:rejectButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 0,
              ),
              child: const Text('Reject'),
            ),
            ElevatedButton(
              onPressed: acceptButton,
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.green,
                elevation: 0,
              ),
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }
  
}