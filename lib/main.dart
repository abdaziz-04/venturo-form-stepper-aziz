import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/configs/routes/route.dart';

import 'configs/pages/page.dart';
import 'configs/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Venturo Form Stepper',
          debugShowCheckedModeBanner: false,
          // initialBinding: , Jika memiliki global bindding
          initialRoute: Routes.profilingRoute,
          theme: mainTheme,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
        );
      },
    );
  }
}
