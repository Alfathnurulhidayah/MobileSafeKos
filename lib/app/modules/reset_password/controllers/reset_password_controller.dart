import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../../services/api_service.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  RxBool isHidden = true.obs;

  RxBool isHiddenConfirm = true.obs;

  late String email;

  @override
  void onInit() {
    super.onInit();

    email = Get.arguments;
  }

  // ================= TOGGLE PASSWORD =================

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  void toggleConfirmPassword() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }

  // ================= RESET PASSWORD =================

  Future<void> resetPassword() async {
    String password = passwordController.text.trim();

    String confirmPassword = confirmPasswordController.text.trim();

    // ================= VALIDASI =================

    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field wajib diisi",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        "Error",
        "Password minimal 6 karakter",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        "Error",
        "Konfirmasi password tidak cocok",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    try {
      final response = await http.post(
        Uri.parse("${ApiService.baseUrl}/reset-password"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email, "new_password": password}),
      );

      final data = jsonDecode(response.body);

      // ================= SUCCESS =================

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          "Error",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.onClose();
  }
}
