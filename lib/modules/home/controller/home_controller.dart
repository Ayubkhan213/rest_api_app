import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rest_api_app/api_connection/api_connection.dart';
import 'package:rest_api_app/common/reusable_data.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/model/student_model.dart';

import 'package:rest_api_app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  GlobalKey<NavigatorState> dialogNavigatorKey = GlobalKey<NavigatorState>();

  RxBool dialogclose = true.obs;
  // hive
  final _myBox = Hive.box('mybox');

  logout() {
    _myBox.deleteAll({'user_id', 'user_email', 'user_name', 'user_password'});
    Get.offAllNamed(Routes.TABB);
  }

  int? userId() {
    return _myBox.get('user_id');
  }

  String? userName() {
    return _myBox.get('user_name');
  }

  String? userEmail() {
    return _myBox.get('user_email');
  }

  String? userpassword() {
    return _myBox.get('user_password');
  }

  @override
  void onReady() async {
    box(color: Colors.transparent, isCircularProgress: true);
    super.onReady();
    await getData();
  }

  getData() async {
    try {
      var response = await http.get(Uri.parse(Api.getData));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          var data = List<StudentModel>.from(
              responseBody['userData'].map((e) => StudentModel.fromJson(e)));
          studentData.value = data;
          Get.back();
        } else {
          print(1);
          Get.back();
        }
      }
    } catch (e) {
      Get.back();
      print(e.toString());
    }
  }

  delete(studentId) async {
    box(color: Colors.transparent, isCircularProgress: true);
    try {
      var response = await http.post(Uri.parse(Api.deleteData),
          body: {'student_id': studentId.toString()});
      if (response.statusCode == 200) {
        Get.back();
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          Get.snackbar(
            'Success',
            'Successfully Delete Data',
            backgroundColor: Colors.lightGreen,
            colorText: MyColors.darkBlue,
          );
          studentData.clear();
          getData();
        }
      }
    } catch (e) {
      Get.back();
      print(e.toString());
    }
  }

  //Dilog box
  box({title, color, isCircularProgress = false}) {
    Get.dialog(AlertDialog(
      elevation: 0.0,
      backgroundColor: color ?? Colors.grey.shade200,
      title: isCircularProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(title ?? ''),
    ));
  }
}
