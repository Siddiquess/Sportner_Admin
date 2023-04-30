import 'package:flutter/material.dart';
import '../../utils/global_colors.dart';


class UserVendorListWidget extends StatelessWidget {

  final String name;
  final String mobile;
  final bool blockStatus;
  final GestureTapCallback? onTap;
  final GestureTapCallback blockButton;
  const UserVendorListWidget({
    super.key,
    required this.name,
    required this.mobile,
    required this.blockStatus,
    required this.onTap,
    required this.blockButton,
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
                    color: blockStatus == true
                        ? AppColors.lightgreen
                        : AppColors.lightred,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: blockButton,
                      splashRadius: 5,
                      icon: Icon(
                        Icons.person,
                        color: blockStatus ? AppColors.green : AppColors.red,
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
