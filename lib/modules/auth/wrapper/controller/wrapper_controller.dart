import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rest_api_app/routes/app_pages.dart';

class WrapperController extends GetxController {
  final _myBox = Hive.box('mybox');

  @override
  void onReady() {
    super.onReady();
    _myBox.get('user_id') != null
        ? Get.offAllNamed(Routes.HOME)
        : Get.offAllNamed(Routes.TABB);
  }
}
