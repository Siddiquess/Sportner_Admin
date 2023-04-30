import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportner_admin/components/snackbar_widget.dart';
import '../components/login_button.dart';
import '../components/textfield.dart';
import '../utils/global_colors.dart';
import '../utils/global_values.dart';
import '../utils/text_styles.dart';
import '../view_model/login_view_model.dart';

final _formKey = GlobalKey<FormState>();

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginViewModel = context.watch<LoginViewModel>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSizes.kHeight20,
                    Text("Admin Login", style: AppTextStyles.loginHeading),
                    const Text(
                      "Sign to continue",
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    AppSizes.kHeight10,
                    SizedBox(
                      height: size.height * 0.25,
                      width: size.width * 0.55,
                      child: Image.asset("assets/playing_man.png")
                      // SvgPicture.asset(
                      //   "assets/login_pic.svg",
                      //   fit: BoxFit.contain,
                      //   // ignore: deprecated_member_use
                      //   color: Colors.green,
                      // ),
                    ),
                    AppSizes.kHeight10,
                    Consumer<LoginViewModel>(
                      builder: (context, userLoginViewModel, child) {
                        return TextFormWidget(
                          isAdmin: true,
                          controller: userLoginViewModel.nameController,
                          labelText: 'Name',
                          textFieldIcon: Icons.person_outline,
                          keyType: TextInputType.text,
                        );
                      },
                    ),
                    Consumer<LoginViewModel>(
                        builder: (context, userLoginViewModel, child) {
                      return TextFormWidget(
                        isPassword: true,
                        controller: userLoginViewModel.passwordController,
                        labelText: 'Password',
                        textFieldIcon: Icons.lock_outline,
                        keyType: TextInputType.text,
                      );
                    }),
                    AppSizes.kHeight30,
                    LoginButtonWidget(
                      onPressed: () async {
                        if (loginViewModel.nameController.text.isEmpty ||
                            loginViewModel.passwordController.text.isEmpty) {
                          return SnackBarWidget.snackBar(
                              context, "Name and password is required");
                        }
                        else if (_formKey.currentState!.validate()) {
                          await context
                              .read<LoginViewModel>()
                              .setAdminLogin(context);
                        }
                      },
                      title: "LOGIN",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
