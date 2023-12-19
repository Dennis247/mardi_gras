import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/common/widgets/appbars/custom_appbar.dart';
import 'package:mardi_gras/common/widgets/buttons/app_button.dart';
import 'package:mardi_gras/common/widgets/input/close_keyboard_wrapper.dart';
import 'package:mardi_gras/common/widgets/input/custom_textfield.dart';
import 'package:mardi_gras/common/widgets/input/password_textfield.dart';
import 'package:mardi_gras/modules/authentication/screens/login/login.viewmodel.dart';
import 'package:mardi_gras/modules/authentication/screens/sigup/singup.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:mardi_gras/styles/spacing.dart';
import 'package:mardi_gras/styles/text.dart';
import 'package:mardi_gras/utils/messenger.dart';
import 'package:mardi_gras/utils/navigator.dart';
import 'package:mardi_gras/utils/validator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key, this.automaticallyImplyLeading = false});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return _ChangePassword(
        automaticallyImplyLeading: automaticallyImplyLeading);
  }
}

class _ChangePassword extends StatefulWidget {
  const _ChangePassword({required this.automaticallyImplyLeading});

  final bool automaticallyImplyLeading;

  @override
  State<_ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<_ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController changePasswordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    changePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    changePasswordController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        var result = await context.read<LoginViewModel>().execute();

        if (!mounted) return;

        Messenger.success(context: context, message: result.message);
        // AppNavigator.pushAndRemoveUntil(context, const DashboardView());
      } catch (e) {
        Messenger.error(context: context, message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();

    return CloseKeyboardWrapper(
      child: Scaffold(
        appBar: const CustomAppBar(
          label: "Change Password",
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter New Password',
                  textAlign: TextAlign.center,
                  style: AppText.bold700(context).copyWith(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                PasswordTextField(
                  labelText: 'Password',
                  controller: emailController,
                  onChanged: (value) {
                    viewModel.email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (Validator.isNotValidEmail(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 2.5.h,
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                PasswordTextField(
                  labelText: 'Verify Password',
                  controller: changePasswordController,
                  onChanged: (value) {
                    viewModel.password = value;
                  },
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 2.5.h,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Secure passwords are at least 8 characters long including numbers, capital letters and symbols.',
                    style: AppText.bold400(context)
                        .copyWith(color: AppColors.grey, fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, _) {
                    return AppButton(
                      label: 'Update Password',
                      isBusy: viewModel.isBusy,
                      onTap: submit,
                    );
                  },
                ),
                SizedBox(
                  height: 12.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
