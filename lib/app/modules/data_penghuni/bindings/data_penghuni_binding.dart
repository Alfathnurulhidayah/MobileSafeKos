import 'package:get/get.dart';
import '../controllers/data_penghuni_controller.dart';

class DataPenghuniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPenghuniController>(() => DataPenghuniController());
  }
}