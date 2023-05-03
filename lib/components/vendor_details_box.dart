import 'package:flutter/material.dart';
import 'package:sportner_admin/utils/global_values.dart';
import 'package:sportner_admin/utils/text_styles.dart';

import '../model/vendor_data_model.dart';
import '../model/venue_data_model.dart';
import '../utils/global_colors.dart';

class VendorDetailsBox {
  static vendorDetailsBox({
    required BuildContext context,
    VmId? vendorData1,
    VmsData? vendorData2,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          elevation: 0,
          children: [
            SimpleDialogOption(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Document",
                    style: AppTextStyles.textH4,
                  ),
                  AppSizes.kHeight10,
                  Container(
                    height: 90,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.lightgrey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "${vendorData1?.image ?? vendorData2?.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.kHeight20,
            SimpleDialogOption(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 3 / 10,
                    child: Text(
                      'Vendor Name',
                      style: AppTextStyles.textH4,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${vendorData1?.name ?? vendorData2?.name}",
                      style: AppTextStyles.textH4,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 3 / 10,
                    child: Text(
                      'Vendor Mobile',
                      style: AppTextStyles.textH4,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${vendorData1?.mobile ?? vendorData2?.mobile}",
                      style: AppTextStyles.textH4,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      child: Text(
                        'Block status ',
                        style: AppTextStyles.textH4,
                      )),
                  Expanded(
                    child: Text(
                      "${vendorData1?.blockStatus ?? vendorData2?.blockStatus}",
                      style: AppTextStyles.textH4,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SimpleDialogOption(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
