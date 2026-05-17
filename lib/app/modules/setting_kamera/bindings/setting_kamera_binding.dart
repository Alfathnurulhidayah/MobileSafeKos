import 'package:get/get.dart';
import '../controllers/setting_kamera_controller.dart';

class SettingKameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingKameraController>(
      () => SettingKameraController(),
    );
  }
}