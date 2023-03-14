import 'package:get/get.dart';
import 'package:rest_api_app/modules/auth/login/page/login_page.dart';
import 'package:rest_api_app/modules/auth/sigup/page/signup_page.dart';

class TabbController extends GetxController {
  List pages = [const LoginPage(), const SignUpPage()];
}
