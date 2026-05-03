import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final namaKosController = TextEditingController();
  final lokasiKosController = TextEditingController();

  void register() {
    if (namaController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        namaKosController.text.isEmpty ||
        lokasiKosController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar("Sukses", "Register berhasil!");
    Get.offAllNamed('/login'); // balik ke login setelah register
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    namaKosController.dispose();
    lokasiKosController.dispose();
    super.onClose();
  }
}