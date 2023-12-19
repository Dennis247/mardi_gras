import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static Future<dynamic> to(BuildContext context, Widget nextScreen) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, Widget nextScreen) async {
    return await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false,
    );
  }

  static Future<dynamic> pushReplacement(BuildContext context, Widget nextScreen) async {
    return await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }
}
