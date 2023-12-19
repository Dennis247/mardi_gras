import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/common/widgets/appbars/custom_appbar.dart';
import 'package:mardi_gras/common/widgets/buttons/app_button.dart';
import 'package:mardi_gras/common/widgets/input/close_keyboard_wrapper.dart';
import 'package:mardi_gras/common/widgets/input/custom_textfield.dart';
import 'package:mardi_gras/common/widgets/input/password_textfield.dart';
import 'package:mardi_gras/modules/authentication/screens/login/login.viewmodel.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:mardi_gras/styles/spacing.dart';
import 'package:mardi_gras/styles/text.dart';
import 'package:mardi_gras/utils/messenger.dart';
import 'package:mardi_gras/utils/validator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, this.automaticallyImplyLeading = false});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return _SignUpScreen(automaticallyImplyLeading: automaticallyImplyLeading);
  }
}

class _SignUpScreen extends StatefulWidget {
  const _SignUpScreen({required this.automaticallyImplyLeading});

  final bool automaticallyImplyLeading;

  @override
  State<_SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<_SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.0.h,
                ),
                Text(
                  'Join us!',
                  textAlign: TextAlign.center,
                  style: AppText.bold700(context).copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Enter your email to recieve verification code.',
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
                  height: 5.0.h,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, _) {
                    return AppButton(
                      label: 'Sign Up',
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
                        text: 'Already have an account? ',
                        style: AppText.bold400(context)
                            .copyWith(color: AppColors.grey, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: AppText.bold600(context).copyWith(
                            color: AppColors.primaryButtonColor,
                            fontSize: 14.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // AppNavigator.to(context, const SignUpScreen());
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
