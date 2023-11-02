import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfilingController extends GetxController {
  static ProfilingController get to => Get.find();

  var nameController = TextEditingController();
  var nameErrorMessage = "".obs;

  var emailController = TextEditingController();
  var emailErrorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(nameListener);
    emailController.addListener(emailListener);
  }

  void nameListener() {
    var name = nameController.text.trim();
    if (name.isEmpty) {
      nameErrorMessage.value = "Nama tidak boleh kosong";
      return;
    }

    nameErrorMessage.value = "";
  }

  void emailListener() {
    var email = emailController.text.trim();
    if (email.isEmpty) {
      emailErrorMessage.value = "Email tidak boleh kosong";
      return;
    }

    if (!isValidEmail(email)) {
      emailErrorMessage.value = "Email tidak sesuai format";
      return;
    }

    emailErrorMessage.value = "";
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
