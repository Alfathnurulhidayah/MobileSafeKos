import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final namaKosController = TextEditingController();
  final lokasiKosController = TextEditingController();
  final hpController = TextEditingController();

  Future<void> register() async {
    try {
      if (namaController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          lokasiKosController.text.isEmpty ||
          hpController.text.isEmpty) {
        Get.snackbar(
          "Error",
          "Semua field wajib diisi!",
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      print("REGISTER DIMULAI");

      final response = await AuthService.register(
        nama: namaController.text,
        email: emailController.text,
        password: passwordController.text,
        namaKos: namaKosController.text,
        lokasiKos: lokasiKosController.text,
        hp: hpController.text,
      );

      print(response);

      if (response["success"] == true) {
        Get.snackbar("Sukses", response["message"]);

        Get.offAllNamed('/login');
      } else {
        Get.snackbar("Error", response["message"]);
      }
    } catch (e) {
      print(e);

      Get.snackbar("ERROR", e.toString());
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    namaKosController.dispose();
    lokasiKosController.dispose();
    hpController.dispose();
    super.onClose();
  }
}
