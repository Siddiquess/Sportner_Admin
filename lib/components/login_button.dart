import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/global_colors.dart';
import '../view_model/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final userLoginViewModel = context.watch<LoginViewModel>();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.appColor,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: userLoginViewModel.isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
        ),
      ),
    );
  }
}
