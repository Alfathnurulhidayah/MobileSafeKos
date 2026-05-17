import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/penghuni_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class DataPenghuniController extends GetxController {
  // ================= SEARCH =================

  final searchController = TextEditingController();

  // ================= DATA =================

  var penghuniList = <PenghuniModel>[].obs;

  var filteredList = <PenghuniModel>[].obs;

  var isLoading = false.obs;

  // ================= INIT =================

  @override
  void onInit() {
    super.onInit();

    getPenghuni();
  }

  // ================= GET DATA PENGHUNI =================

  Future<void> getPenghuni() async {
    try {
      isLoading.value = true;

      final response = await AuthService.getPenghuni();

      print(response);

      if (response["success"] == true) {
        final List data = response["data"];

        penghuniList.value = data
            .map((e) => PenghuniModel.fromJson(e))
            .toList();

        filteredList.value = penghuniList;
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

  // ================= SEARCH =================

  void searchPenghuni(String query) {
    if (query.isEmpty) {
      filteredList.value = penghuniList;
    } else {
      filteredList.value = penghuniList
          .where(
            (p) =>
                p.nama.toLowerCase().contains(query.toLowerCase()) ||
                p.kamar.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  // ================= EDIT =================

  Future<void> keEditPenghuni(PenghuniModel penghuni) async {
    final result = await Get.toNamed(Routes.EDIT_PENGHUNI, arguments: penghuni);

    // ================= REFRESH DATA =================

    if (result != null) {
      await getPenghuni();

      penghuniList.refresh();
      filteredList.refresh();

      update();
    }
  }

  // ================= CLOSE =================

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}
