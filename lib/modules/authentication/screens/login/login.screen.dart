import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/common/widgets/appbars/custom_appbar.dart';
import 'package:mardi_gras/common/widgets/buttons/app_button.dart';
import 'package:mardi_gras/common/widgets/input/close_keyboard_wrapper.dart';
import 'package:mardi_gras/common/widgets/input/custom_textfield.dart';
import 'package:mardi_gras/common/widgets/input/password_textfield.dart';
import 'package:mardi_gras/modules/authentication/screens/changepassword/change.password.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.automaticallyImplyLeading = false});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return _LoginScreen(automaticallyImplyLeading: automaticallyImplyLeading);
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({required this.automaticallyImplyLeading});

  final bool automaticallyImplyLeading;

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          automaticallyImplyLeading: false,
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
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: AppText.bold700(context).copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Enter your email and password to sign in.',
                  textAlign: TextAlign.center,
                  style: AppText.bold400(context)
                      .copyWith(fontSize: 12.sp, color: AppColors.grey),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                CustomTextField(
                  labelText: 'Email',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 2.5.h,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s+')),
                  ],
                  onChanged: (value) {
                    viewModel.email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (Validator.isNotValidEmail(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                PasswordTextField(
                  labelText: 'Password',
                  controller: passwordController,
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
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      AppNavigator.to(context, const ChangePassword());
                    },
                    child: Text(
                      'Forgot Password',
                      style: AppText.bold400(context)
                          .copyWith(color: AppColors.grey, fontSize: 12.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, _) {
                    return AppButton(
                      label: 'Sign In',
                      isBusy: viewModel.isBusy,
                      onTap: submit,
                    );
                  },
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: AppText.bold400(context)
                            .copyWith(color: AppColors.grey, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: AppText.bold600(context).copyWith(
                            color: AppColors.primaryButtonColor,
                            fontSize: 14.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AppNavigator.to(context, const SignUpScreen());
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
