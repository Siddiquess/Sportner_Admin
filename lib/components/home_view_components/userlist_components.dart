import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/view_model/user_data_view_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class UserListComponents extends StatelessWidget {
  const UserListComponents({
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
                  "Users",
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
        const UserListWidget()
      ],
    );
  }
}

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final usersViewModel = context.watch<UserDataViewModel>();
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: usersViewModel.userDataList.length,
      itemBuilder: (context, index) {
        final userDatas = usersViewModel.userDataList[index];
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
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    userDatas.name.toString(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text("${userDatas.mobile ?? userDatas.email}"),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      usersViewModel.getUserBlockStatus(userId: userDatas.id!);
                    },
                    splashRadius: 5,
                    icon: Icon(Icons.person,
                        color:
                            userDatas.blockStatus! ? Colors.red : Colors.green),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => AppSizes.kHeight10,
    );
  }
}
