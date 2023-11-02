import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';

class ProfilingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilingController());
  }
}
