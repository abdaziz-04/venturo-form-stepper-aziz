import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilingController extends GetxController {
  static ProfilingController get to => Get.find();
  var nameController = TextEditingController();
  var nameErrorMessage = "".obs;
  var emailController = TextEditingController();
  var emailErrorMessage = "".obs;
  var phoneController = TextEditingController();
  var phoneErrorMessage = "".obs;
  final TextEditingController passwordController = TextEditingController();
  final RxString passwordErrorMessage = RxString('');
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$',
  );
  var obscurePassword = true.obs;
  var passwordConfirmationController = TextEditingController();
  var passwordConfirmationErrorMessage = "".obs;
  var obscurePasswordConfirmation = true.obs;

  var formProgress = 0.obs;

  void showPassword() {
    obscurePassword.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    passwordConfirmationController.addListener(passwordConfirmationListener);
    nameController.addListener(nameListener);
    emailController.addListener(emailListener);
    phoneController.addListener(phoneListener);
    passwordController.addListener(passwordListener);
  }

  void passwordConfirmationListener() {
    var passwordConfirmation = passwordConfirmationController.text.trim();
    var password = passwordController.text.trim();

    if (passwordConfirmation.isEmpty) {
      passwordConfirmationErrorMessage.value =
          "Konfirmasi Kata sandi tidak boleh kosong";
      return;
    }

    if (passwordConfirmation != password) {
      passwordConfirmationErrorMessage.value =
          "Konfirmasi Kata sandi tidak sama";
      return;
    }

    passwordConfirmationErrorMessage.value = "";
    updateFormProgress();
  }

  void showConfirmationPassword() {
    obscurePasswordConfirmation.toggle();
  }

  void nameListener() {
    var name = nameController.text.trim();
    if (name.isEmpty) {
      nameErrorMessage.value = "Nama tidak boleh kosong";
      return;
    }
    nameErrorMessage.value = "";
    updateFormProgress();
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
    updateFormProgress();
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
    updateFormProgress();
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void passwordListener() {
    var password = passwordController.text.trim();

    if (password.isEmpty) {
      passwordErrorMessage.value = "Password tidak boleh kosong";
      return;
    }
    if (!passwordRegex.hasMatch(password)) {
      passwordErrorMessage.value =
          "Password harus mengandung 1 huruf besar, 1 huruf kecil, dan 1 angka serta minimal 8 karakter";
      return;
    }
    passwordErrorMessage.value = "";
    updateFormProgress();
  }

  void updateFormProgress() {
    int progress = 0;

    if (nameErrorMessage.value.isEmpty && nameController.text.isNotEmpty) {
      progress += 1;
    }
    if (emailErrorMessage.value.isEmpty && emailController.text.isNotEmpty) {
      progress += 1;
    }
    if (phoneErrorMessage.value.isEmpty && phoneController.text.isNotEmpty) {
      progress += 1;
    }
    if (passwordErrorMessage.value.isEmpty &&
        passwordController.text.isNotEmpty) {
      progress += 1;
    }
    if (passwordConfirmationErrorMessage.value.isEmpty &&
        passwordConfirmationController.text.isNotEmpty) {
      progress += 1;
    }

    formProgress.value = progress;
  }
}
