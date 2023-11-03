import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/shared/styles/color_style.dart';

class ProfilingScreen extends StatelessWidget {
  ProfilingScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var controller = ProfilingController.to;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Obx(() {
                  String? errorMessage;

                  errorMessage = controller.nameErrorMessage.value.trim();
                  if (errorMessage.isEmpty) {
                    errorMessage = null;
                  }

                  return CustomTextFieldWidget(
                    controller: controller.nameController,
                    errorMessage: errorMessage,
                    label: 'Nama',
                    hint: 'Masukkan nama anda',
                  );
                }),
                SizedBox(height: 16.h),
                Obx(() {
                  String? errorMessage;

                  errorMessage = controller.emailErrorMessage.value.trim();
                  if (errorMessage.isEmpty) {
                    errorMessage = null;
                  }

                  return CustomTextFieldWidget(
                    controller: controller.emailController,
                    errorMessage: errorMessage,
                    label: 'Email',
                    hint: 'Masukkan email anda',
                    inputType: TextInputType.emailAddress,
                  );
                }),
                SizedBox(height: 16.h),
                Obx(() {
                  String? errorMessage;

                  errorMessage = controller.phoneErrorMessage.value.trim();
                  if (errorMessage.isEmpty) {
                    errorMessage = null;
                  }

                  return CustomTextFieldWidget(
                    controller: controller.phoneController,
                    errorMessage: errorMessage,
                    label: 'No HP',
                    hint: 'Masukkan No HP anda',
                    inputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  );
                }),
                SizedBox(height: 16.h),
                Obx(() {
                  String? errorMessage;

                  errorMessage = controller.passwordErrorMessage.value.trim();
                  if (errorMessage.isEmpty) {
                    errorMessage = null;
                  }

                  var obscurePassword = controller.obscurePassword.value;

                  return CustomTextFieldWidget(
                    controller: controller.passwordController,
                    errorMessage: errorMessage,
                    label: 'Kata Sandi',
                    hint: 'Masukkan kata sandi anda',
                    inputType: TextInputType.visiblePassword,
                    obscureText: obscurePassword,
                    suffixIcon: InkWell(
                      onTap: () => controller.showPassword(),
                      child: Icon(obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  );
                }),
                SizedBox(height: 16.h),
                const TextField(),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit Form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
