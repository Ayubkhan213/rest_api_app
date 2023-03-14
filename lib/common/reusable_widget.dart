//Height
// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/constant/colors.dart';

Widget ph(double height) {
  return SizedBox(
    height: height,
  );
}

//Width
Widget pw(double width) {
  return SizedBox(
    width: width,
  );
}

//Text
Widget text({
  required String txt,
  double? size,
  weight,
  alignmant,
  color,
}) {
  return Text(
    txt,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
    textAlign: alignmant,
  );
}

//Input Field
Widget inputField({
  required controller,
  required save,
  required validation,
  required String hint,
  required IconData prefixIcon,
  keybord,
  bool? isPassword,
  Widget? suffix,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey.shade300,
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: keybord ?? TextInputType.text,
          obscureText: isPassword ?? false,
          controller: controller,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
          validator: validation,
          onSaved: save,
          decoration: InputDecoration(
              suffixIcon: suffix ?? null,
              border: InputBorder.none,
              prefixIcon: Icon(
                prefixIcon,
                color: const Color(0xFF182C61),
              ),
              hintText: hint),
        )),
  );
}

//Divider
Widget divider() {
  return const Expanded(
      child: Divider(
    thickness: 1.5,
    color: MyColors.lightBlue,
  ));
}

//Button for Google and Facebook Login
Widget btn({
  required color,
  required backgroundColor,
  required imageName,
  required String buttontxt,
  required tab,
}) {
  return Expanded(
    child: ActionChip(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      backgroundColor: backgroundColor,
      onPressed: tab,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 22.0,
            child: Image(image: AssetImage(imageName)),
          ),
          text(
            txt: buttontxt,
            color: color,
          )
        ],
      ),
    ),
  );
}

//Search Box
Widget searchBox(height, width, change) {
  return SizedBox(
    height: height,
    width: width,
    child: TextFormField(
      onChanged: change,
      style: const TextStyle(color: Colors.white54),
      decoration: InputDecoration(
        hintText: 'Search By Name',
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.white54,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white54)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}

//Heading Container with Gradient Colors
Widget headGradientContainer({
  required String heading,
  required height,
}) {
  return Container(
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
    height: height,
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
            txt: heading,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
