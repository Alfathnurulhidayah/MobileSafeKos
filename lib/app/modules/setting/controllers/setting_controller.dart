import 'dart:ui';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../data/camera_data.dart';

class SettingController extends GetxController {
  // ================= NOTIF =================

  var alertStranger = true.obs;
  var alertUnverified = true.obs;

  var durasiTrigger = "30s".obs;
  var sensitivitas = "Sedang".obs;

  // ================= ZONA =================
  var isEditZona = false.obs;
  var points = <Offset>[
    const Offset(60, 50),
    const Offset(220, 40),
    const Offset(250, 150),
    const Offset(80, 170),
  ].obs;
  void toggleZona() {
    isEditZona.value = !isEditZona.value;
  }

  // ================= CAMERA =================

  RxList<CameraModel> kameraList = CameraData.kameraList;

  Future<void> testKamera(String nama) async {
    Get.snackbar(
      "Testing Kamera",
      "$nama sedang diuji...",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );

    await Future.delayed(const Duration(seconds: 2));

    Get.snackbar(
      "Berhasil",
      "$nama berhasil terhubung",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void toggleCamera(CameraModel camera) {
    camera.isOnline.value = !camera.isOnline.value;
  }

  void tambahKamera() {
    Get.toNamed(Routes.SETTING_KAMERA, arguments: "setting");
  }
}
