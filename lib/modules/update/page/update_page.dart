import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/common/reusable_widget.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/modules/update/controller/update_controller.dart';

class UpdatePage extends GetView<UpdateController> {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //first container with gradient
            headGradientContainer(
              heading: 'Update Data page',
              height: height * 0.16,
            ),
            //height
            ph(height * 0.02),
            //heading
            Text(
              'Update Student Records',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            //height
            ph(height * 0.02),
            //Form with Expanded
            Expanded(
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    //name Field
                    inputField(
                      controller: controller.nameController,
                      save: (value) {
                        value == ''
                            ? value = controller.data.studentName
                            : value;
                        controller.name = value;
                      },
                      validation: (value) {
                        value == ''
                            ? value = controller.data.studentName
                            : value;
                        return controller.nameValidation(value);
                      },
                      hint: controller.data.studentName,
                      prefixIcon: Icons.person,
                    ),
                    //age Field
                    inputField(
                      keybord: TextInputType.number,
                      controller: controller.ageController,
                      save: (value) {
                        value == ''
                            ? value = controller.data.studentAge
                            : value;
                        controller.age = value;
                      },
                      validation: (value) {
                        value == ''
                            ? value = controller.data.studentAge
                            : value;
                        return controller.ageValidation(value);
                      },
                      hint: controller.data.studentAge,
                      prefixIcon: Icons.calendar_month,
                    ),
                    //address Field
                    inputField(
                      controller: controller.addressController,
                      save: (value) {
                        value == ''
                            ? value = controller.data.studentAddress
                            : value;
                        controller.address = value;
                      },
                      validation: (value) {
                        value == ''
                            ? value = controller.data.studentAddress
                            : value;
                        return controller.addressValidation(value);
                      },
                      hint: controller.data.studentAddress,
                      prefixIcon: Icons.location_city_outlined,
                    ),
                    //contect field
                    inputField(
                      keybord: TextInputType.number,
                      controller: controller.contectController,
                      save: (value) {
                        value == ''
                            ? value = controller.data.studentContect
                            : value;
                        controller.contect = value;
                      },
                      validation: (value) {
                        value == ''
                            ? value = controller.data.studentContect
                            : value;
                        return controller.contectValidation(value);
                      },
                      hint: controller.data.studentContect,
                      prefixIcon: Icons.phone,
                    ),
                    //height
                    ph(height * 0.02),

                    //Update Button
                    Obx(
                      () => ActionChip(
                        backgroundColor: MyColors.darkBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.3,
                          vertical: height * 0.022,
                        ),
                        onPressed: () {
                          controller.checkUpdateData();
                        },
                        label: controller.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : text(
                                txt: 'Update Data',
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
