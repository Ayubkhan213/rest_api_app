import 'package:get/get.dart';
import 'package:rest_api_app/modules/auth/wrapper/controller/wrapper_controller.dart';

class WrapperBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WrapperController>(WrapperController());
  }
}
