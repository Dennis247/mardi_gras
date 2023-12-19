import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:mardi_gras/styles/text.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.backgroundColor,
    this.disabled = false,
    this.isBusy = false,
    this.child,
    this.elevation = 0,
    this.icon,
    this.border,
    this.padding,
    this.width,
    this.borderRadius,
    this.labelStyle,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color? labelColor;
  final Color? backgroundColor;
  final bool disabled;
  final bool isBusy;
  final Widget? child;
  final double elevation;
  final String? icon;
  final BorderSide? border;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: width ?? size.width,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : isBusy
                ? () {}
                : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryButtonColor,
          elevation: elevation,
          padding: padding ?? EdgeInsets.symmetric(vertical: 1.8.h),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: border ?? BorderSide.none,
          ),
        ),
        child: isBusy
            ? SizedBox(
                height: 3.h,
                width: 3.h,
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator(color: Colors.white)
                    : const CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
              )
            : Text(
                label,
                style: labelStyle ??
                    AppText.bold400(context).copyWith(
                      color: labelColor ?? Colors.white,
                    ),
              ),
      ),
    );
  }
}
