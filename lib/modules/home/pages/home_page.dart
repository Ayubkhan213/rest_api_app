import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rest_api_app/common/reusable_data.dart';
import 'package:rest_api_app/common/reusable_widget.dart';
import 'package:rest_api_app/constant/colors.dart';
import 'package:rest_api_app/modules/home/controller/home_controller.dart';
import 'package:rest_api_app/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    // var width = size.width;
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
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        controller.logout();
                      },
                      icon: const Icon(Icons.logout),
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: text(
                      txt: 'Home Page',
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ph(height * 0.02),
            Text(
              'Student Records',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: studentData.isEmpty ? 1 : studentData.length,
                    itemBuilder: (context, index) {
                      return studentData.isEmpty
                          ? Center(
                              child: text(
                                txt: 'No Data Found',
                                color: MyColors.darkBlue,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 10.0),
                                height: height * 0.12,
                                decoration: BoxDecoration(
                                  color: MyColors.lightBlue,
                                  borderRadius: BorderRadius.circular(15.0),
                                  gradient: index.isEven
                                      ? const LinearGradient(
                                          colors: [
                                            MyColors.darkBlue,
                                            MyColors.lightBlue,
                                            MyColors.darkBlue,
                                            MyColors.lightBlue,
                                          ],
                                        )
                                      : LinearGradient(
                                          colors: [
                                            Colors.grey.shade100,
                                            Colors.grey.shade200,
                                            Colors.grey.shade100,
                                          ],
                                        ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                          txt: studentData[index].studentName,
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                        text(
                                          txt:
                                              'Age :  ${studentData[index].studentAge}',
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                        text(
                                          txt:
                                              studentData[index].studentContect,
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller.delete(
                                                    studentData[index]
                                                        .studentId);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                                size: 20.0,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Get.toNamed(Routes.UPDATEDATA,
                                                    arguments:
                                                        studentData[index]);
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.yellowAccent,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        text(
                                          txt:
                                              studentData[index].studentAddress,
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
              ),
            ),
            ph(height * 0.01),
            //Bottom Container With Linear Gradient
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ADDDATA);
              },
              child: Container(
                height: height * 0.08,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
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
                ),
                child: Center(
                  child: text(
                    txt: 'AddData',
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
