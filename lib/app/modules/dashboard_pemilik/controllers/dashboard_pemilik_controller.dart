import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class DashboardPemilikController extends GetxController {
  // =========================
  // BOTTOM NAVIGATION
  // =========================

  var selectedIndex = 0.obs;

  // =========================
  // NAMA KOS
  // =========================

  var namaKos = "Kos".obs;

  // =========================
  // DATA GRAFIK
  // =========================

  var spots = <double>[50, 35, 20, 40, 55, 50, 40].obs;

  Timer? timer;

  // =========================
  // INIT
  // =========================

  @override
  void onInit() {
    super.onInit();

    startRealtimeChart();

    getProfile();
  }

  // =========================
  // CHANGE BOTTOM NAV
  // =========================

  void changeBottomNav(int index) {
    selectedIndex.value = index;
  }

  // =========================
  // GET PROFILE
  // =========================

  Future<void> getProfile() async {
    try {
      final response = await AuthService.getProfile();

      print(response);

      if (response["success"] == true) {
        namaKos.value = response["data"]["kos"]["nama_kos"];
      }
    } catch (e) {
      print(e);
    }
  }

  // =========================
  // REALTIME CHART
  // =========================

  void startRealtimeChart() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      final random = Random();

      spots.removeAt(0);

      spots.add(20 + random.nextInt(40).toDouble());
    });
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void onClose() {
    timer?.cancel();

    super.onClose();
  }
}
