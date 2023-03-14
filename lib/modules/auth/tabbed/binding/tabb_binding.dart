import 'package:get/get.dart';
import 'package:rest_api_app/modules/auth/login/controller/login_controller.dart';
import 'package:rest_api_app/modules/auth/sigup/controller/signup_controller.dart';
import 'package:rest_api_app/modules/auth/tabbed/controller/tabb_controller.dart';

class TabbBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TabbController>(TabbController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
