import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isOwnerSelected = true.obs;

  void selectOwner() {
    isOwnerSelected.value = true;
  }

  void selectPenghuni() {
    isOwnerSelected.value = false;
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan Password wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (isOwnerSelected.value) {
      Get.snackbar("Login", "Login sebagai Pemilik Kos");
    } else {
      Get.snackbar("Login", "Login sebagai Penghuni");
    }
  }
}