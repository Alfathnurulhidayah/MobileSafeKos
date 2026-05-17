import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../models/penghuni_model.dart';
import '../../../services/api_service.dart';
import '../../../services/auth_service.dart';

class EditPenghuniController extends GetxController {
  // ================= CONTROLLER =================

  final namaController = TextEditingController();

  final kamarController = TextEditingController();

  final hpController = TextEditingController();

  // ================= STORAGE =================

  final box = GetStorage();

  // ================= IMAGE PICKER =================

  final ImagePicker picker = ImagePicker();

  var images = <XFile>[].obs;

  // ================= DATA =================

  late PenghuniModel penghuni;

  // ================= INIT =================

  @override
  void onInit() {
    super.onInit();

    penghuni = Get.arguments;

    namaController.text = penghuni.nama;

    kamarController.text = penghuni.kamar;

    hpController.text = penghuni.hp;
  }

  // ================= KAMERA =================

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

  // ================= GALLERY =================

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

  // ================= HAPUS FOTO =================

  void hapusFoto(int index) {
    images.removeAt(index);
  }

  // ================= SIMPAN =================

  Future<void> simpan() async {
    if (namaController.text.trim().isEmpty ||
        kamarController.text.trim().isEmpty ||
        hpController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field wajib diisi",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final response = await AuthService.editPenghuni(
      id: penghuni.id,
      nama: namaController.text.trim(),
      kamar: kamarController.text.trim(),
      hp: hpController.text.trim(),
    );

    if (response["success"] == true) {
      final updatedPenghuni = penghuni.copyWith(
        nama: namaController.text.trim(),
        kamar: kamarController.text.trim(),
        hp: hpController.text.trim(),
      );
      Get.back(result: updatedPenghuni);

      Get.snackbar(
        "Berhasil",
        response["message"],
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Error",
        response["message"],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ================= HAPUS =================

  void hapus() {
    Get.defaultDialog(
      title: "Konfirmasi",

      middleText: "Yakin ingin menghapus penghuni?",

      textConfirm: "Ya",

      textCancel: "Batal",

      confirmTextColor: Colors.white,

      onConfirm: () async {
        Get.back();

        final response = await AuthService.deletePenghuni(penghuni.id);

        if (response["success"] == true) {
          Get.back(result: "deleted");

          Get.snackbar(
            "Sukses",
            response["message"],
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            response["message"],
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
    );
  }

  // ================= CLOSE =================

  @override
  void onClose() {
    namaController.dispose();

    kamarController.dispose();

    hpController.dispose();

    super.onClose();
  }
}
