import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/auth_service.dart';

class ProfileController extends GetxController {
  // ================= TEXT CONTROLLER =================

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  // ================= REACTIVE =================

  var profileName = ''.obs;

  var namaKos = ''.obs;

  var profileImage = Rx<File?>(null);

  var isLoading = false.obs;

  final ImagePicker picker = ImagePicker();

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

        // ================= SET DATA =================

        profileName.value = data["nama"] ?? '';

        namaKos.value = data["kos"]["nama_kos"] ?? '';

        // ================= TEXTFIELD =================

        nameController.text = data["nama"] ?? '';

        emailController.text = data["email"] ?? '';

        addressController.text = data["kos"]["lokasi_kos"] ?? '';

        phoneController.text = data["hp"] ?? '';
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

  // ================= CAMERA =================

  Future<void> pickImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  // ================= GALLERY =================

  Future<void> pickImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  // ================= SAVE =================

  Future<void> saveProfile() async {
    profileName.value = nameController.text;

    Get.snackbar(
      'Berhasil',
      'Profile berhasil diperbarui',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // ================= CLOSE =================

  @override
  void onClose() {
    nameController.dispose();

    emailController.dispose();

    phoneController.dispose();

    addressController.dispose();

    super.onClose();
  }
}
