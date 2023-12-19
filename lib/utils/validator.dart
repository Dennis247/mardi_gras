import 'package:all_validations_br/all_validations_br.dart';

class Validator {
  static bool isNotValidEmail(String? value) {
    if (AllValidations.isEmail(value!)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }

  static String? compare({
    String? value,
    required String otherEntry,
    String? requiredErrorText,
    String? mismatchErrorText,
  }) {
    if (value!.trim().isEmpty) {
      return requiredErrorText ?? 'Confirm Password is required';
    } else if (value != otherEntry) {
      return mismatchErrorText ?? "Password Mismatch";
    }

    // if (value!.trim().isEmpty) {
    //   return 'Confirm Password is required';
    // } else if (value.length <= 5) {
    //   return 'Confirm Password must not be less than 5 characters';
    // } else if (value == passwordEntry) {
    //   return "Password Mismatch";
    // }

    return null;
  }
}

class PhoneNumberValidator {
  static bool isCorrectLength(String? value) {
    if (value != null && value.length == 11) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordValidator {
  static bool isNotCorrectLength(String? value) {
    if (value != null && value.length > 7) {
      return false;
    } else {
      return true;
    }
  }

  static bool isNotTheSame({
    required String text1,
    required String text2,
  }) {
    if (text1 == text2) {
      return false;
    } else {
      return true;
    }
  }
}
