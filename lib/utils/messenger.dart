import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Messenger {
  static success({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      child: CustomMessenger.success(message: message),
    );
  }

  static error({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      child: CustomMessenger.error(message: message),
    );
  }

  static info({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      child: CustomMessenger.info(message: message),
    );
  }

  static snackBar({
    required BuildContext context,
    required Widget child,
    bool persistent = false,
  }) {
    showTopSnackBar(
      context,
      child,
      padding: EdgeInsets.zero,
      persistent: persistent,
      dismissType: DismissType.onTap,
    );
  }
}

class CustomMessenger extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color cardColor;
  final String message;
  final Function()? close;

  const CustomMessenger.success({
    Key? key,
    required this.message,
    this.icon = Icons.check_circle,
    this.color = Colors.green,
    this.cardColor = AppColors.successCardColor,
    this.close,
  }) : super(key: key);

  const CustomMessenger.error({
    Key? key,
    required this.message,
    this.icon = Icons.error,
    this.color = Colors.red,
    this.cardColor = AppColors.errorCardColor,
    this.close,
  }) : super(key: key);

  const CustomMessenger.info({
    Key? key,
    required this.message,
    this.icon = Icons.info,
    this.color = Colors.black,
    this.cardColor = AppColors.infoCardColor,
    this.close,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
      padding: EdgeInsets.all(6.sp),
      decoration: BoxDecoration(
        color: cardColor.withOpacity(.99),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: color,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: color,
                    fontSize: 12.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToastMessenger {
  static info({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static error({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: AppColors.error,
    );
  }

  static success({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(BuildContext context, {required Widget child}) {
    Fluttertoast.showToast(
      msg: 'Max limit reached',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
