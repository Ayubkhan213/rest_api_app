import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rest_api_app/common/reusable_data.dart';
// import 'package:rest_api_app/common/reusable_data.dart';
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
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //First Gradient Container
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
              height: height * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //First Row For Home Text And Logout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.3),
                        child: text(
                          txt: 'Home Page',
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.logout();
                        },
                        icon: const Icon(Icons.logout),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  //Search Box
                  searchBox(height * 0.065, width * 0.8, (value) {
                    controller.searchDataByName(value);
                  }),
                ],
              ),
            ),
            //Height
            ph(height * 0.02),
            //Heading Text
            Text(
              'Student Records',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            //Body ListView Builder
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: searchData.isEmpty ? 1 : searchData.length,
                    itemBuilder: (context, index) {
                      return searchData.isEmpty
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
                                          txt: searchData[index].studentName,
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                        text(
                                          txt:
                                              'Age :  ${searchData[index].studentAge}',
                                          color: index.isOdd
                                              ? MyColors.darkBlue
                                              : Colors.white,
                                        ),
                                        text(
                                          txt: searchData[index].studentContect,
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
                                                    searchData[index]
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
                                                        searchData[index]);
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
                                          txt: searchData[index].studentAddress,
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
            //Height
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
