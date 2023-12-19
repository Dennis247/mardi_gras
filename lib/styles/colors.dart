import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF04142F);
  static const primaryButtonColor = Color(0xFF004EC3);
  static const secondary = Color(0xFFF5A302);
  static const textDefault = Color(0xFF202727);
  static const textGrey = Colors.black45;
  static const grey = Color(0xFF596476);
  static const lightGrey = Color(0xFFEBECEE);
  static const error = Color.fromRGBO(228, 20, 20, 0.8);
  static const infoCardColor = Color(0xFFD7F1FD);
  static const successCardColor = Color(0xFFEDFBD8);
  static const errorCardColor = Color(0xFFFCE8DB);
  static const scaffoldBackgroundColor = Color(0xfff6f6f6);

  static final boxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(.05),
      offset: const Offset(0, 4),
      blurRadius: 10,
      spreadRadius: 2,
    ),
  ];

  static const gradient = LinearGradient(
    colors: [
      Color(0xff1C71B7),
      Color(0xff09263D),
    ],
  );
}
