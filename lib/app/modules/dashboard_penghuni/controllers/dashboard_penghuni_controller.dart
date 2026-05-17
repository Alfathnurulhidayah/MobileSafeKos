import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../../../data/tamu_data.dart';
import '../../../models/tamu_model.dart';

class DashboardPenghuniController extends GetxController {
  // ================= TEXT CONTROLLER =================

  final namaTamuController = TextEditingController();

  // ================= PROFILE DATA =================

  var namaPenghuni = ''.obs;

  var namaKos = ''.obs;

  var kamar = ''.obs;

  var isLoading = false.obs;

  // ================= DROPDOWN =================

  var selectedTime = '19:00'.obs;

  List<String> times = ['18:00', '19:00', '20:00', '21:00', '22:00'];

  // ================= INIT =================

  @override
  void onInit() {
    super.onInit();

    getProfile();
  }

  // ================= GET PROFILE =================

  Future<void> getProfile() async {
    try {
      isLoading.value = true;

      final response = await AuthService.getProfile();

      print(response);

      if (response["success"] == true) {
        final data = response["data"];

        namaPenghuni.value = data["nama"] ?? '';

        namaKos.value = data["kos"]["nama_kos"] ?? '';

        kamar.value = data["kamar"] ?? '';
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
    } finally {
      isLoading.value = false;
    }
  }

  // ================= DAFTARKAN TAMU =================

  void daftarkanTamu() {
    if (namaTamuController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Nama tamu wajib diisi",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    TamuData.tamuAktif.insert(
      0,
      TamuModel(
        nama: namaTamuController.text,
        jam: selectedTime.value,
        status: "Menunggu",
      ),
    );

    Get.snackbar(
      "Berhasil",
      "Tamu berhasil didaftarkan",
      snackPosition: SnackPosition.BOTTOM,
    );

    namaTamuController.clear();
  }

  // ================= PANIC BUTTON =================

  void activatePanic() {
    Get.toNamed(Routes.PANIC_BUTTON, arguments: true);
  }

  // ================= LOGOUT =================

  Future<void> logout() async {
    await AuthService.logout();

    Get.offAllNamed('/login');
  }

  // ================= CLOSE =================

  @override
  void onClose() {
    namaTamuController.dispose();

    super.onClose();
  }
}
