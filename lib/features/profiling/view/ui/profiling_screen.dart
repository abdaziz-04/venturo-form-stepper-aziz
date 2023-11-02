import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/shared/styles/color_style.dart';

class ProfilingScreen extends StatelessWidget {
  ProfilingScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    hintText: 'Masukkan nama anda',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelStyle: const TextStyle(
                      color: ColorStyle.primary,
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
                  ),
                ),
                SizedBox(height: 16.h),
                const TextField(),
                SizedBox(height: 16.h),
                const TextField(),
                SizedBox(height: 16.h),
                const TextField(),
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
