import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/auth_service.dart';

class RegisPenghuniController extends GetxController {
  // =========================
  // CONTROLLER
  // =========================

  final namaController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final kamarController = TextEditingController();

  final hpController = TextEditingController();

  // =========================
  // IMAGE PICKER
  // =========================

  final ImagePicker picker = ImagePicker();

  var images = <XFile>[].obs;

  // =========================
  // BUKA KAMERA
  // =========================

  Future<void> bukaKamera() async {
    if (images.length >= 3) {
      Get.snackbar(
        "Maksimal",
        "Foto hanya boleh 3",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final picked = await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      images.add(picked);
    }
  }

  // =========================
  // BUKA GALLERY
  // =========================

  Future<void> bukaGallery() async {
    if (images.length >= 3) {
      Get.snackbar(
        "Maksimal",
        "Foto hanya boleh 3",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      images.add(picked);
    }
  }

  // =========================
  // HAPUS FOTO
  // =========================

  void hapusFoto(int index) {
    images.removeAt(index);
  }

  // =========================
  // SIMPAN PENGHUNI
  // =========================

  Future<void> simpanPenghuni() async {
    try {
      // =========================
      // VALIDASI FIELD
      // =========================

      if (namaController.text.trim().isEmpty ||
          emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty ||
          kamarController.text.trim().isEmpty ||
          hpController.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "Semua field wajib diisi",
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      // =========================
      // VALIDASI FOTO
      // =========================

      if (images.length != 3) {
        Get.snackbar(
          "Error",
          "Foto wajah harus 3",
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      print("UPLOAD PENGHUNI DIMULAI");

      // =========================
      // REQUEST API
      // =========================

      final response = await AuthService.registerPenghuni(
        nama: namaController.text.trim(),

        email: emailController.text.trim(),

        password: passwordController.text.trim(),

        kamar: kamarController.text.trim(),

        hp: hpController.text.trim(),

        fotoPaths: images.map((e) => e.path).toList(),
      );

      print(response);

      // =========================
      // SUCCESS
      // =========================

      if (response["success"] == true) {
        namaController.clear();

        emailController.clear();

        passwordController.clear();

        kamarController.clear();

        hpController.clear();

        images.clear();

        Get.snackbar(
          "Sukses",
          response["message"],
          snackPosition: SnackPosition.BOTTOM,
        );

        Future.delayed(const Duration(milliseconds: 800), () {
          Get.offNamed('/data-penghuni');
        });
      } else {
        Get.snackbar(
          "Error",
          response["message"],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void onClose() {
    namaController.dispose();

    emailController.dispose();

    passwordController.dispose();

    kamarController.dispose();

    hpController.dispose();

    super.onClose();
  }
}
