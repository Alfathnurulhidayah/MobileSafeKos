import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

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

  Future<void> login() async {
    try {
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

      String role = isOwnerSelected.value ? "pemilik" : "penghuni";

      print("LOGIN DIMULAI");

      final response = await AuthService.login(
        email: email,
        password: password,
        role: role,
      );

      print(response);

      if (response["success"] == true) {
        await AuthService.saveToken(response["token"]);

        Get.snackbar("Sukses", response["message"]);

        if (role == "pemilik") {
          Get.offAllNamed(Routes.DASHBOARD_PEMILIK);
        } else {
          Get.offAllNamed(Routes.DASHBOARD_PENGHUNI);
        }
      } else {
        Get.snackbar("Error", response["message"]);
      }
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString());
    }
  }
}
