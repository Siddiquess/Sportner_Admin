import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/alert_box_widget.dart';
import 'package:sportner_admin/components/error_widget.dart';
import 'package:sportner_admin/components/glass_snack_bar.dart';
import 'package:sportner_admin/components/home_view_components/user_vendor_list.dart';
import 'package:sportner_admin/view_model/user_data_view_model.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class UserListComponents extends StatelessWidget {
  const UserListComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserDataViewModel>();
    return userViewModel.isLoading
        ? const Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
            ),
          )
        : userViewModel.errorCode == 404
            ? SizedBox(height: 500.h, child: const NoInternetWidget())
            : userViewModel.userDataList.isEmpty
                ? SizedBox(height: 500.h, child: const NoDataWidget())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            child:
                                _userListWidget(usersViewModel: userViewModel),
                          ),
                        )
                      ],
                    ),
                  );
  }
}

_userListWidget({required UserDataViewModel usersViewModel}) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemCount: usersViewModel.userDataList.length,
    separatorBuilder: (context, index) => AppSizes.kHeight10,
    itemBuilder: (context, index) {
      final userData = usersViewModel.userDataList[index];
      return UserVendorListWidget(
        name: userData.name!,
        mobile: userData.mobile ?? userData.email ?? "NO mobile",
        blockStatus: userData.blockStatus!,
        onTap: null,
        blockButton: () {
          AlertBoxWidget.alertBox(
            context: context,
            blockButton: () {
              usersViewModel.getUserBlockStatus(
                userId: userData.id!,
              );
              GlassSnackBar.snackBar(
                context: context,
                color: userData.blockStatus! ? Colors.green : Colors.redAccent,
                title: "${userData.blockStatus! ? "Unblock" : "Block"} User!",
                subtitle:
                    "User ${userData.blockStatus! ? "Unblocked" : "Blocked"} Successfully!",
              );
              Navigator.pop(context);
            },
            blockStatus: userData.blockStatus!,
            title: "User",
            blockText: userData.blockStatus! ? "Unblock" : "Block",
          );
        },
      );
    },
  );
}
