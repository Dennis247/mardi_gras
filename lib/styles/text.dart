import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppText {
  AppText._();

  static TextStyle bold300(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold400(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold500(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold600(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold700(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold800(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 14.sp,
        );
  }

  static TextStyle bold900(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 14.sp,
        );
  }
}
