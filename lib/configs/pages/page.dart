import 'package:get/get.dart';
import 'package:venturo_form_stepper/configs/routes/route.dart';
import 'package:venturo_form_stepper/features/splash/bindings/splash_binding.dart';
import 'package:venturo_form_stepper/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
