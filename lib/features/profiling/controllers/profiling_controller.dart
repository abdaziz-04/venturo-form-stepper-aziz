import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfilingController extends GetxController {
  static ProfilingController get to => Get.find();

  var nameController = TextEditingController();
  var nameErrorMessage = "".obs;

  var emailController = TextEditingController();
  var emailErrorMessage = "".obs;

  var phoneController = TextEditingController();
  var phoneErrorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(nameListener);
    emailController.addListener(emailListener);
    phoneController.addListener(phoneListener);
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

  void phoneListener() {
    var phone = phoneController.text.trim();
    if (phone.isEmpty) {
      phoneErrorMessage.value = "No Hp tidak boleh kosong";
      return;
    }

    if (phone.isNotEmpty && phone.length < 9) {
      phoneErrorMessage.value = "No Hp minimal terdiri dari 9 karakter";
      return;
    }

    if (phone.startsWith("0")) {
      phoneErrorMessage.value = "Tidak boleh diawali dengan 0";
      return;
    }

    phoneErrorMessage.value = "";
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
