import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
