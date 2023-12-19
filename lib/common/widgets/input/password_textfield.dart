// ignore_for_file: unused_element

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mardi_gras/common/widgets/input/custom_textfield.dart';
import 'package:sizer/sizer.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.labelText,
      this.title,
      this.textInputAction,
      this.onChanged,
      this.validate = false,
      this.validator,
      this.prefixIcon})
      : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? title;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool validate;
  final Widget? prefixIcon;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  void _onToggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  String? _customValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final field = CustomTextField(
      title: widget.title,
      obscure: _hidePassword,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      labelText: widget.labelText,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s+')),
      ],
      suffixIcon: _PasswordIcon(
        _hidePassword,
        onTap: _onToggleVisibility,
      ),
      onChanged: widget.onChanged,
      validator: widget.validator ??
          (widget.validate
              ? (value) {
                  if (widget.validate) return _customValidator(value);

                  return null;
                }
              : null),
    );

    return field;
  }
}

class _PasswordIcon extends StatelessWidget {
  const _PasswordIcon(
    this._showPassword, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final bool _showPassword;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        _showPassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        size: 14.sp,
        color: Colors.grey,
      ),
    );
  }
}
