import 'package:get/get.dart';

import '../controllers/dashboard_pemilik_controller.dart';

class DashboardPemilikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardPemilikController>(
      () => DashboardPemilikController(),
    );
  }
}