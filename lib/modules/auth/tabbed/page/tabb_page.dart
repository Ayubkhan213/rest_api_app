import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/common/reusable_widget.dart';
import 'package:rest_api_app/modules/auth/tabbed/controller/tabb_controller.dart';

class TabbPage extends GetView<TabbController> {
  const TabbPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    // var width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
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
              height: height * 0.24,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  labelPadding: const EdgeInsets.only(bottom: 6.0),
                  tabs: [
                    text(txt: 'Login', size: 20.0),
                    text(
                      txt: 'Signup',
                      size: 20.0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ...List.generate(
                    controller.pages.length,
                    (index) => controller.pages[index],
                  ),
                ],
              ),
            ),

            //Bottom Container With Linear Gradient
            Container(
              height: height * 0.1,
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
            ),
          ],
        ),
      ),
    );
  }
}
