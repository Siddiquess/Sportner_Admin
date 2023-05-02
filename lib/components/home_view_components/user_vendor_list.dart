import 'package:flutter/material.dart';
import '../../model/vendor_data_model.dart';
import '../../utils/global_colors.dart';

class UserVendorListWidget extends StatelessWidget {
  final String name;
  final String mobile;
  final bool blockStatus;
  final GestureTapCallback? onTap;
  final GestureTapCallback blockButton;
  final VmsData? vendorData;
  final GestureTapCallback? vmAcceptButton;
  const UserVendorListWidget({
    super.key,
    required this.name,
    required this.mobile,
    required this.blockStatus,
    required this.onTap,
    required this.blockButton,
    this.vendorData,
    this.vmAcceptButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  mobile,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 118, 118, 118),
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: vendorData?.status == "pending"
                        ? const Color.fromARGB(65, 255, 193, 7)
                        : blockStatus == true
                            ? AppColors.lightgreen
                            : AppColors.lightred,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: vendorData?.status == "pending"
                          ? vmAcceptButton
                          : blockButton,
                      splashRadius: 5,
                      icon: Icon(
                        blockStatus?
                        Icons.person_off:Icons.person,
                        color: vendorData?.status == "pending"
                            ? Colors.amber
                            : blockStatus
                                ? AppColors.green
                                : AppColors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
