import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/constant/colors.dart';

import '../../../../common/reusable_widget.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return ListView(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Welcom Back!',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ph(height * 0.02),
        Form(
          key: controller.key,
          child: Column(
            children: [
              inputField(
                controller: controller.emailController,
                save: (value) {
                  controller.email = value;
                },
                validation: (value) {
                  return controller.emailValidation(value);
                },
                hint: 'Email',
                prefixIcon: Icons.email,
              ),
              Obx(
                () => inputField(
                  controller: controller.passwordController,
                  save: (value) {
                    controller.password = value;
                  },
                  validation: (value) {
                    return controller.passwordValidation(value);
                  },
                  hint: 'Password',
                  prefixIcon: Icons.lock,
                  isPassword: controller.isPassword.value,
                  suffix: IconButton(
                      onPressed: () {
                        controller.isPassword.value =
                            !controller.isPassword.value;
                      },
                      icon: Icon(
                        controller.isPassword.value
                            ? Icons.key_off_outlined
                            : Icons.key_outlined,
                        color: MyColors.lightBlue,
                      )),
                ),
              ),
              ph(height * 0.02),
              Obx(
                () => ActionChip(
                  onPressed: () {
                    controller.checkLogin();
                  },
                  backgroundColor: MyColors.darkBlue,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.35,
                    vertical: height * 0.02,
                  ),
                  label: controller.loading.value
                      ? const CircularProgressIndicator()
                      : text(
                          txt: 'Login',
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                ),
              ),
              ph(height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    divider(),
                    pw(width * 0.02),
                    text(txt: 'Or Login With', color: MyColors.lightBlue),
                    pw(width * 0.02),
                    divider(),
                  ],
                ),
              ),
              ph(height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    //Button For google Login
                    btn(
                        color: MyColors.darkBlue,
                        backgroundColor: Colors.white,
                        imageName: 'assets/images/google.png',
                        buttontxt: 'Google',
                        tab: () {}),
                    pw(width * 0.04),
                    //Button for facebook login
                    btn(
                      color: Colors.white,
                      backgroundColor: MyColors.darkBlue,
                      imageName: 'assets/images/facebook.png',
                      buttontxt: 'Facebook',
                      tab: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
