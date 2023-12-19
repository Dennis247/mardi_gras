import 'package:flutter/material.dart';
import 'package:mardi_gras/styles/spacing.dart';
import 'package:mardi_gras/styles/text.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.actions,
    this.logoColor,
    this.showGradientBackground = true,
    this.automaticallyImplyLeading = true,
    this.title,
    this.label,
    this.leadingWidth,
    this.onBackPressed,
    this.elevation,
    this.centerTitle = true,
  }) : super(key: key);

  final Color? logoColor;
  final Widget? leading;
  final Widget? title;
  final String? label;
  final List<Widget>? actions;
  final bool showGradientBackground;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final Function()? onBackPressed;
  final double? elevation;
  final bool centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(10.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0.h),
      child: AppBar(
        centerTitle: centerTitle,
        automaticallyImplyLeading: automaticallyImplyLeading,
        elevation: elevation,
        leading: automaticallyImplyLeading
            ? leading ?? CustomBackButton(onBackPressed: onBackPressed)
            : null,
        leadingWidth: leadingWidth,
        title: title ??
            Text(
              label ?? '',
              style: AppText.bold700(context).copyWith(
                fontSize: 14.sp,
              ),
            ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.horizontal),
            child: Row(children: actions == null ? [] : actions!),
          ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onBackPressed});

  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: onBackPressed ??
          () {
            Navigator.pop(context);
          },
    );
  }
}
