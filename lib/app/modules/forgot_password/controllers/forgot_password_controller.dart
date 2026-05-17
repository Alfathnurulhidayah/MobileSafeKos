import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../services/api_service.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  // ================= VALIDASI EMAIL =================

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // ================= KIRIM OTP =================

  Future<void> kirimKode() async {
    print("BUTTON DIKLIK");

    String email = emailController.text.trim();

    // ================= VALIDASI KOSONG =================

    if (email.isEmpty) {
      Get.snackbar(
        "Error",
        "Email wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    // ================= VALIDASI EMAIL =================

    if (!isValidEmail(email)) {
      Get.snackbar(
        "Error",
        "Format email tidak valid!",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    try {
      print("MULAI REQUEST API");

      final response = await http.post(
        Uri.parse("${ApiService.baseUrl}/forgot-password"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email}),
      );

      print(response.body);

      final data = jsonDecode(response.body);

      // ================= SUCCESS =================

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );

        // ================= PINDAH VERIFY OTP =================

        Get.toNamed(Routes.VERIFY_OTP, arguments: email);
      } else {
        Get.snackbar(
          "Error",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // ================= KEMBALI LOGIN =================

  void kembaliLogin() {
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }
}
