import 'package:get/get.dart';

class DetailNotifikasiController extends GetxController {
  void lihatKamera() {
    Get.snackbar("Info", "Lihat Kamera diklik");
  }

  void hubungiPenghuni() {
    Get.snackbar("Info", "Hubungi Penghuni diklik");
  }

  void tandaiAman() {
    Get.snackbar("Status", "Notifikasi ditandai aman");
  }

  void abaikan() {
    Get.snackbar("Status", "Notifikasi diabaikan");
  }

  void markAllRead() {
    Get.snackbar("Info", "Mark all as read diklik");
  }
}