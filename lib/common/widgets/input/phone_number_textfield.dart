import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/common/widgets/input/custom_textfield.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.title,
    this.textInputAction,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? title;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title,
      hintText: hintText,
      labelText: labelText ?? 'Phone Number',
      textInputAction: textInputAction,
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }
}
