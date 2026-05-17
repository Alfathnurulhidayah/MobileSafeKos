import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../data/camera_data.dart';
import '../../setting/controllers/setting_controller.dart';

class SettingKameraController extends GetxController {
  TextEditingController ipController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  void connectCamera() {
    String nama = namaController.text.trim();
    String ip = ipController.text.trim();

    if (nama.isEmpty || ip.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Semua field wajib diisi",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    CameraData.kameraList.add(CameraModel(nama: nama, ip: ip, online: true));

    final asal = Get.arguments;

    Future.delayed(const Duration(milliseconds: 300), () {
      if (asal == "dashboard") {
        Get.offNamed(Routes.SETTING);
      } else {
        Get.back();
      }
    });
  }

  @override
  void onClose() {
    ipController.dispose();
    namaController.dispose();

    super.onClose();
  }
}
