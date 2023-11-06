import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/shared/styles/color_style.dart';
import 'package:venturo_form_stepper/shared/widgets/custom_text_field_widget.dart';

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
                Row(
                  children: [
                    /* Lingkaran Step Profiling 1*/
                    Obx(() {
                      var profilingStepIndex =
                          controller.profilingStepIndex.value;

                      /// Jika step profiling pada step 1 (index = 0) atau lebih
                      ///
                      /// Berikan warna lingkaran menjadi [ColorStyle.primary]
                      /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
                      var selected = false;
                      if (profilingStepIndex >= 0) {
                        selected = true;
                      }

                      return Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: selected
                              ? ColorStyle.primary
                              : ColorStyle.colorE9ECEF,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),

                    /* Garis Step Profiling 1 */
                    Obx(() {
                      var profilingStepIndex =
                          controller.profilingStepIndex.value;

                      /// Jika step profiling pada step 2 (index 1) atau lebih
                      ///
                      /// Berikan warna container menjadi [ColorStyle.primary]
                      /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
                      var selected = false;
                      if (profilingStepIndex >= 1) {
                        selected = true;
                      }

                      return Expanded(
                        child: Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: selected
                                ? ColorStyle.primary
                                : ColorStyle.colorE9ECEF,
                          ),
                        ),
                      );
                    }),
                    /* Lingkaran Step Profiling 2 */
                    Obx(() {
                      var profilingStepIndex =
                          controller.profilingStepIndex.value;

                      /// Jika step profiling pada step 2 (index = 1) atau lebih
                      ///
                      /// Berikan warna lingkaran menjadi [ColorStyle.primary]
                      /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
                      var selected = false;
                      if (profilingStepIndex >= 1) {
                        selected = true;
                      }

                      return Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: selected
                              ? ColorStyle.primary
                              : ColorStyle.colorE9ECEF,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                    /* Garis Step Profiling 2 */
                    Obx(() {
                      var profilingStepIndex =
                          controller.profilingStepIndex.value;

                      /// Jika step profiling pada step 3 (index 2)
                      ///
                      /// Berikan warna container menjadi [ColorStyle.primary]
                      /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
                      var selected = false;
                      if (profilingStepIndex == 2) {
                        selected = true;
                      }

                      return Expanded(
                        child: Container(
                          height: 5.h,
                          color: selected
                              ? ColorStyle.primary
                              : ColorStyle.colorE9ECEF,
                        ),
                      );
                    }),
                    /* Lingkaran Step Profiling 3 */
                    Obx(() {
                      var profilingStepIndex =
                          controller.profilingStepIndex.value;

                      /// Jika step profiling pada step 3 (index = 2)
                      ///
                      /// Berikan warna lingkaran menjadi [ColorStyle.primary]
                      /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
                      var selected = false;
                      if (profilingStepIndex == 2) {
                        selected = true;
                      }

                      return Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: selected
                              ? ColorStyle.primary
                              : ColorStyle.colorE9ECEF,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ],
                ),
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
                Obx(() {
                  String? errorMessage;

                  errorMessage =
                      controller.passwordConfirmationErrorMessage.value.trim();
                  if (errorMessage.isEmpty) {
                    errorMessage = null;
                  }

                  var obscurePassword =
                      controller.obscurePasswordConfirmation.value;

                  return CustomTextFieldWidget(
                    controller: controller.passwordConfirmationController,
                    errorMessage: errorMessage,
                    label: 'Konfirmasi Kata Sandi',
                    hint: 'Masukkan konfirmasi kata sandi',
                    inputType: TextInputType.visiblePassword,
                    obscureText: obscurePassword,
                    suffixIcon: InkWell(
                      onTap: () => controller.showConfirmationPassword(),
                      child: Icon(obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  );
                }),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorStyle.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          minimumSize: const Size(0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: ColorStyle.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
