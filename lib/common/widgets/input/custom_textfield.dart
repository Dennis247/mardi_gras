import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:mardi_gras/styles/text.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? titleTextStyle;
  final TextInputType? textInputType;
  final bool obscure;
  final bool? isPasswordTextField;
  final TextEditingController? controller;
  final int? inputLimit;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool filled;
  final Color? fillColor;
  final bool isMultipleLine;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    Key? key,
    this.title,
    this.labelText,
    this.hintText,
    this.hintTextStyle,
    this.labelTextStyle,
    this.titleTextStyle,
    this.textInputType,
    this.obscure = false,
    this.isPasswordTextField,
    this.controller,
    this.inputLimit,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.autovalidateMode,
    this.errorText,
    this.filled = false,
    this.fillColor,
    this.isMultipleLine = false,
    this.border,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.lightGrey,
        width: 2.5,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    final padding = EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 2.w);

    final field = Material(
      type: MaterialType.transparency,
      child: TextFormField(
        //autofocus: true,
        textCapitalization: textCapitalization,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: AppText.bold500(context),
        keyboardType: textInputType,
        obscureText: obscure,
        maxLength: inputLimit,
        textInputAction: textInputAction,
        onTap: onTap,
        maxLines: (obscure == true) ? 1 : maxLines,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          filled: filled,
          fillColor: fillColor ?? AppColors.grey.withOpacity(.1),
          errorText: errorText,
          errorStyle: AppText.bold500(context).copyWith(
            color: AppColors.error,
            fontSize: 12.sp,
          ),
          contentPadding: contentPadding ?? padding,
          labelText: labelText,
          hintText: hintText,
          prefix: prefix,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: padding,
                  child: prefixIcon,
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: 10.sp,
            minHeight: 24.sp,
          ),
          suffixText: suffixText,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: padding,
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: 24.sp,
            minHeight: 24.sp,
          ),
          suffixStyle: AppText.bold500(context).copyWith(
            fontSize: 11.sp,
          ),
          hintStyle: hintTextStyle ??
              AppText.bold500(context).copyWith(
                color: AppColors.grey,
              ),
          labelStyle: labelTextStyle ??
              AppText.bold500(context).copyWith(
                color: AppColors.grey,
                fontSize: 12.sp,
              ),
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          enabledBorder: border ?? defaultBorder,
          focusedBorder: border ?? defaultBorder,
          disabledBorder: defaultBorder,
          border: defaultBorder,
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
        ),
      ),
    );

    if (title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: titleTextStyle ?? AppText.bold400(context),
          ),
          SizedBox(height: 8.h),
          field,
        ],
      );
    } else {
      return field;
    }
  }
}

class TextFieldIcon extends StatelessWidget {
  const TextFieldIcon({
    Key? key,
    required this.icon,
    this.onTap,
    this.color,
    this.padding,
    this.size,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.only(left: 11.w),
        child: Icon(
          icon,
          size: size ?? 20.sp,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

class PasswordIcon extends StatelessWidget {
  const PasswordIcon(
    this._showPassword, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final bool _showPassword;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        _showPassword ? Icons.visibility_off : Icons.remove_red_eye,
        size: 15.sp,
        color: Colors.black54,
      ),
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textDefault,
          ),
    );
  }
}
