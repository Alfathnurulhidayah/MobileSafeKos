import 'package:get/get.dart';

import '../../dashboard_penghuni/controllers/dashboard_penghuni_controller.dart';

class DashboardPenghuniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardPenghuniController>(
      () => DashboardPenghuniController(),
    );
  }
}