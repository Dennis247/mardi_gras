import 'package:mardi_gras/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.disabled = false,
    this.elevation = 0,
    this.icon,
    this.border,
    this.padding,
    this.width,
    this.borderRadius,
    this.labelStyle,
  }) : super(key: key);

  final Function() onTap;
  final Color? backgroundColor;
  final bool disabled;
  final Widget child;
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
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          elevation: elevation,
          disabledBackgroundColor: AppColors.primary.withOpacity(.3),
          padding: padding ?? EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: border ?? BorderSide.none,
          ),
        ),
        child: child,
      ),
    );
  }
}
