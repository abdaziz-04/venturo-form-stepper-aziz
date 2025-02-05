import 'package:get/get.dart';

import '../controllers/profiling_controller.dart';

class ProfilingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilingController());
  }
}
