// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/api_connection/api_connection.dart';
import 'package:rest_api_app/model/user.dart';

class SignupController extends GetxController {
  // Form Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  RxBool isPassword = true.obs;

  // decloration controller
  late TextEditingController nameController,
      passwordController,
      emailController;

  // valiable for controller with no value
  var name = '';
  var email = '';
  var password = '';

  //init function with decleration controller
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  // name validation
  String? nameValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else {
      return null;
    }
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
  final loading = false.obs;

  //check Signup
  void checkSignUp() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();
    loading.value = true;
    validateUserEmail();
  }

  //Validate User Email
  validateUserEmail() async {
    try {
      var res = await http.post(Uri.parse(Api.validateEmail),
          body: {'user_email': email.trim()});

      if (res.statusCode == 200) {
        var responceBody = jsonDecode(res.body);
        responceBody['emailFound']
            ? Get.snackbar(
                'Error!',
                'Email Already Exist',
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP,
              )
            : signUp();
      } else {
        Get.snackbar(
          'Error!',
          'Responce Donot Come',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  signUp() async {
    var userModel = User(
      user_name: name.trim(),
      user_email: name.trim(),
      user_password: password.trim(),
    );
    var responce =
        await http.post(Uri.parse(Api.signUp), body: userModel.toJson());
    if (responce.statusCode == 200) {
      var responceBody = jsonDecode(responce.body);
      if (responceBody['success']) {
        loading.value = false;
        Get.snackbar(
          'Success',
          'Successfully Signup',
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );

        nameController.text = '';
        emailController.text = '';
        passwordController.text = '';
      } else {
        Get.snackbar(
          'Error!',
          'There is some problem in Signup',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  // close function
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
