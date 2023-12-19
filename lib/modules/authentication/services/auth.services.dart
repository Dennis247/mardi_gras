import 'dart:async';
import 'package:mardi_gras/common/models/base.response.dart';

class AuthService {
  static Future<BaseResponse> signIn(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 4));

      return BaseResponse(
        isSucessfull: true,
        message: "Sign-in successful",
        data: null,
      );
    } catch (e, s) {
      await Future.delayed(const Duration(seconds: 4));

      return BaseResponse(
          isSucessfull: false, message: "Sign-in failed: $e $s", data: null);
    }
  }
}
