import 'package:get/get.dart';
import 'package:rest_api_app/modules/update/controller/update_controller.dart';

class UpdateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateController>(() => UpdateController());
  }
}
