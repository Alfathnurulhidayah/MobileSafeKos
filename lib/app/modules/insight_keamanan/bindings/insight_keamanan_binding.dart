import 'package:get/get.dart';

import '../controllers/insight_keamanan_controller.dart';

class InsightKeamananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsightKeamananController>(
      () => InsightKeamananController(),
    );
  }
}
