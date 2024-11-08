// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final double? cursorWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fieldBackGroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusNode,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.cursorWidth,
    this.suffixIcon,
    this.prefixIcon,
    this.fieldBackGroundColor,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLength,
      decoration: InputDecoration(
        enabled: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
        hintStyle: hintStyle ?? TextStyles.font13DarkGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font16DarkSemiBold,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
