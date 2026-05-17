import 'package:get/get.dart';

import '../controllers/panic_button_controller.dart';

class PanicButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanicButtonController>(
      () => PanicButtonController(),
    );
  }
}
