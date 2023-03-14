import 'package:get/get.dart';
import 'package:rest_api_app/modules/add_data/controller/add_data_controller.dart';

class AddDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataController>(() => AddDataController());
  }
}
