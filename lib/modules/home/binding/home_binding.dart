import 'package:get/get.dart';
import 'package:rest_api_app/modules/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(() => HomeController());
    Get.put<HomeController>(HomeController());
  }
}
