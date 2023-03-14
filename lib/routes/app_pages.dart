// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:rest_api_app/modules/add_data/binding/add_data_binding.dart';
import 'package:rest_api_app/modules/auth/tabbed/page/tabb_page.dart';
import 'package:rest_api_app/modules/auth/wrapper/binding/wrapper_binding.dart';
import 'package:rest_api_app/modules/auth/wrapper/pages/wrapper_page.dart';
import 'package:rest_api_app/modules/home/binding/home_binding.dart';
import 'package:rest_api_app/modules/home/pages/home_page.dart';
import 'package:rest_api_app/modules/update/binding/update_binding.dart';
import '../modules/add_data/page/add_data_page.dart';
import '../modules/auth/tabbed/binding/tabb_binding.dart';
import '../modules/update/page/update_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = _Paths.WRAPPER;
  static final routes = [
    GetPage(
      name: Routes.WRAPPER,
      page: () => const WrapperPage(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: Routes.TABB,
      page: () => const TabbPage(),
      binding: TabbBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADDDATA,
      page: () => const AddDataPage(),
      binding: AddDataBinding(),
    ),
    GetPage(
      name: Routes.UPDATEDATA,
      page: () => const UpdatePage(),
      binding: UpdateBinding(),
    ),
  ];
}
