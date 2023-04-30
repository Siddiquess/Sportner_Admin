import 'package:flutter/material.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';

class ListOfUserAndVendor extends StatelessWidget {
  const ListOfUserAndVendor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
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
              children: const [
                Text("Siddique"),
                Text("+919993933945"),
                Icon(Icons.person, color: Colors.green)
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
