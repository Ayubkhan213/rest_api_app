import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init hive
  await Hive.initFlutter();
  //open box
  await Hive.openBox('mybox');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api App',
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
          color: MyColors.darkBlue,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        )),
        // scaffoldBackgroundColor: const Color(0xFF192a56),
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    ),
  );
}
