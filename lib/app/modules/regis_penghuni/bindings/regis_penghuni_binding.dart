import 'package:get/get.dart';
import '../controllers/regis_penghuni_controller.dart';

class RegisPenghuniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisPenghuniController>(() => RegisPenghuniController());
  }
}