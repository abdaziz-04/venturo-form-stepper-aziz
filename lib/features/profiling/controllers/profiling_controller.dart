import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfilingController extends GetxController {
  static ProfilingController get to => Get.find();

  var nameController = TextEditingController();
  var nameErrorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(nameListener);
  }

  void nameListener() {
    var name = nameController.text.trim();
    if (name.isEmpty) {
      nameErrorMessage.value = "Nama tidak boleh kosong";
      return;
    }

    nameErrorMessage.value = "";
  }
}
