// ignore_for_file: unnecessary_null_comparison, unused_import, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/api_connection/api_connection.dart';
import 'package:rest_api_app/common/reusable_data.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/model/student_model.dart';

class AddDataController extends GetxController {
  // Form Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // decloration controller
  late TextEditingController nameController,
      ageController,
      addressController,
      contectController;

  // valiable for controller with no value
  var name = '';
  var address = '';
  var contect = '';
  var age = '';

  //init function with decleration controller
  @override
  void onInit() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    ageController = TextEditingController();
    contectController = TextEditingController();

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

  // Age validation
  String? ageValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else {
      return null;
    }
  }

  // Address validation
  String? addressValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else {
      return null;
    }
  }

  // Contect validation
  String? contectValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    } else if (value.length < 11 || value.length > 11) {
      return 'Please Put a 11 Digit Number';
    } else {
      return null;
    }
  }

// variable for loading
  final loading = false.obs;

//check Signup
  void checkAddData() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();

    loading.value = true;
    addData();
  }

  addData() async {
    var studentModelData = StudentModel(
        studentName: name,
        studentAge: age,
        studentAddress: address,
        studentContect: contect);
    try {
      var response = await http.post(Uri.parse(Api.sendData),
          body: studentModelData.toJson());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          nameController.text = '';
          addressController.text = '';
          ageController.text = '';
          contectController.text = '';
          Get.snackbar(
            'Success',
            'Your data is Successfully Insert',
            backgroundColor: Colors.lightGreen,
            colorText: MyColors.darkBlue,
          );
          studentData.clear();
          var response = await http.get(Uri.parse(Api.getData));
          if (response.statusCode == 200) {
            var responseBody = jsonDecode(response.body);

            var data = List<StudentModel>.from(
                responseBody['userData'].map((e) => StudentModel.fromJson(e)));
            searchData.value = data;
            studentData.value = data;
          }
          loading.value = false;
        }
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  // close function
  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    ageController.dispose();
    contectController.dispose();
    super.onClose();
  }
}
