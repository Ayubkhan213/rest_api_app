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
            //First Linear Container
            headGradientContainer(
              heading: 'Adding Data page',
              height: height * 0.16,
            ),
            ph(height * 0.02),
            Text(
              'Add Student Records',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            //Height
            ph(height * 0.02),

            //Form With Expanded Widget
            Expanded(
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    //Name input Field
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
                    //Age input Field
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
                    //address Input Field
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
                    //Contect Input Field
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
                    //heighte
                    ph(height * 0.02),
                    //submit Button
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
