import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/features/profiling/sub_features/profiling_one/controllers/profiling_profiling_one_controller.dart';

class ProfilingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilingController());
    Get.put(ProfilingProfilingOneController());
  }
}
