// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/common/reusable_widget.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/modules/add_data/controller/add_data_controller.dart';

class AddDataPage extends GetView<AddDataController> {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.2, 0.3, 0.4, 0.7, 0.8, 1.0],
                    colors: [
                      Color(0xFF30336b),
                      Color(0xFF182C61),
                      Color(0xFF30336b),
                      Color(0xFF182C61),
                      Color(0xFF30336b),
                      Color(0xFF30336b)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
              height: height * 0.16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: text(
                      txt: 'Adding Data Page',
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ph(height * 0.02),
            Text(
              'Add Student Records',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ph(height * 0.02),
            Expanded(
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    inputField(
                      controller: controller.nameController,
                      save: (value) {
                        controller.name = value;
                      },
                      validation: (value) {
                        return controller.nameValidation(value);
                      },
                      hint: 'Name',
                      prefixIcon: Icons.person,
                    ),
                    inputField(
                      keybord: TextInputType.number,
                      controller: controller.ageController,
                      save: (value) {
                        controller.age = value;
                      },
                      validation: (value) {
                        return controller.ageValidation(value);
                      },
                      hint: 'Age',
                      prefixIcon: Icons.calendar_month,
                    ),
                    inputField(
                      controller: controller.addressController,
                      save: (value) {
                        controller.address = value;
                      },
                      validation: (value) {
                        return controller.addressValidation(value);
                      },
                      hint: 'Address',
                      prefixIcon: Icons.location_city_outlined,
                    ),
                    inputField(
                      keybord: TextInputType.number,
                      controller: controller.contectController,
                      save: (value) {
                        controller.contect = value;
                      },
                      validation: (value) {
                        return controller.contectValidation(value);
                      },
                      hint: 'Contect',
                      prefixIcon: Icons.phone,
                    ),
                    ph(height * 0.02),
                    Obx(
                      () => ActionChip(
                        backgroundColor: MyColors.darkBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.3,
                          vertical: height * 0.022,
                        ),
                        onPressed: () {
                          controller.checkAddData();
                        },
                        label: controller.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : text(
                                txt: 'Add Data',
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
