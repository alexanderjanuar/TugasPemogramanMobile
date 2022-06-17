import 'package:flutter/material.dart';
import 'controller/HomeController.dart';
import 'package:get/get.dart';
import 'Home.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);
  final page = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Favorite Course",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(
                      "${page.favoriteCourseLen.value} Course",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    ))
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(),
          margin: const EdgeInsets.fromLTRB(25, 5, 30, 0),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 2,
            color: Color(0xFFFFFFB72B),
          ))),
        ),
        SizedBox(height: 20),
        Column(
          children: page.favoriteList,
        )
      ],
    );
  }
}
