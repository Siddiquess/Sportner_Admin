import 'package:flutter/material.dart';

import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';
import 'list_off_user_and_vendor.dart';

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
        const ListOfUserAndVendor()
      ],
    );
  }
}
