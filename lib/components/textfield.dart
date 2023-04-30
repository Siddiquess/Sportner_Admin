import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/snackbar_widget.dart';
import '../utils/global_colors.dart';
import '../utils/global_values.dart';
import '../view_model/login_view_model.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData textFieldIcon;
  final TextInputType keyType;
  final bool isPassword;
  final bool isAdmin;

  const TextFormWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textFieldIcon,
    required this.keyType,
    this.isPassword = false,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    final adminLoginViewModel = context.watch<LoginViewModel>();
    final isShowPassword = adminLoginViewModel.isShowPassword;
    final passController = adminLoginViewModel.passwordController;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        minLines: 1,
        controller: controller,
        obscureText: isPassword ? isShowPassword : false,
        keyboardType: keyType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIconColor: AppColors.klightBlackColor,
          prefixIcon: Icon(textFieldIcon, size: 25),
          suffixIconColor: AppColors.klightBlackColor,
          suffixIcon: isPassword && passController.text.isNotEmpty
              ? Consumer<LoginViewModel>(
                  builder: (context, loginViewModel, child) {
                  return InkWell(
                    onTap: () {
                      loginViewModel.setShowPassword();
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: isShowPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  );
                })
              : AppSizes.kHeight10,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.klightBlackColor,
          ),
        ),
      ),
    );
  }
}
