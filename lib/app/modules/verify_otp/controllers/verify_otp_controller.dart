import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../../services/api_service.dart';

class VerifyOtpController extends GetxController {
  final otpController = TextEditingController();

  late String email;

  // ================= LOADING =================

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // AMBIL EMAIL DARI HALAMAN SEBELUMNYA

    email = Get.arguments;
  }

  // ================= VERIFY OTP =================

  Future<void> verifyOtp() async {
    String otp = otpController.text.trim();

    // ================= VALIDASI =================

    if (otp.isEmpty) {
      Get.snackbar(
        "Error",
        "Kode OTP wajib diisi",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (otp.length != 6) {
      Get.snackbar(
        "Error",
        "OTP harus 6 digit",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse("${ApiService.baseUrl}/verify-otp"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email, "otp": otp}),
      );

      final data = jsonDecode(response.body);

      // ================= SUCCESS =================

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );

        // ================= PINDAH RESET PASSWORD =================

        Get.toNamed(Routes.RESET_PASSWORD, arguments: email);
      } else {
        Get.snackbar(
          "Error",
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // ================= RESEND OTP =================

  Future<void> resendOtp() async {
    try {
      final response = await http.post(
        Uri.parse("${ApiService.baseUrl}/forgot-password"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email}),
      );

      final data = jsonDecode(response.body);

      Get.snackbar(
        "Info",
        data['message'],
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    otpController.dispose();

    super.onClose();
  }
}
