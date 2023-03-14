// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/api_connection/api_connection.dart';
import 'package:rest_api_app/model/user.dart';
import 'package:rest_api_app/routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isPassword = true.obs;

//my box
  final _myBox = Hive.box('mybox');
  // Form Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // decloration controller
  late TextEditingController emailController, passwordController;

  // valiable for controller with no value
  var email = '';
  var password = '';

  //init function with decleration controller
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

// email validation
  String? emailValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please provide Validate Email';
    } else {
      return null;
    }
  }

  // password validation
  String? passwordValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else if (value.length <= 5) {
      return 'Password Must be 6 letter';
    } else {
      return null;
    }
  }

  // variable for loading
  RxBool loading = false.obs;

  // CheckLogin
  void checkLogin() async {
    final isValid = key.currentState!.validate();

    if (!isValid) {
      return;
    }
    key.currentState!.save();

    login();
  }

  login() async {
    try {
      loading.value = true;
      var responce = await http.post(Uri.parse(Api.login), body: {
        'user_email': email.trim(),
        'user_password': password.trim(),
      });

      if (responce.statusCode == 200) {
        var responcebody = jsonDecode(responce.body);
        if (responcebody['success']) {
          emailController.text = '';
          passwordController.text = '';
          loading.value = false;
          var data = User.fromJson(responcebody['userData']);

          _myBox.putAll({
            'user_id': data.user_id,
            'user_name': data.user_name,
            'user_email': data.user_email,
            'user_password': data.user_password
          });
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar(
            'Invalid Email!',
            'Please try to Currect your email or password',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );

          emailController.text = '';
          passwordController.text = '';
          loading.value = false;
        }
      }
      if (responce.statusCode == 404) {
        print('not found');
      }
    } catch (e) {
      print(e.toString());
      loading.value = false;
    }
  }

  var emailValid = false.obs;

  // close  function
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
