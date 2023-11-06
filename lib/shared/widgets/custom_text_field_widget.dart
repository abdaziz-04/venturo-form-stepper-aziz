import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_form_stepper/shared/styles/color_style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.errorMessage,
    this.label,
    this.hint,
    this.inputType = TextInputType.name,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String? errorMessage;
  final String? label;
  final String? hint;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorMessage,
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
          color: errorMessage != null ? ColorStyle.danger : ColorStyle.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: ColorStyle.primary,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
