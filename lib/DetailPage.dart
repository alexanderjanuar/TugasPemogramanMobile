import 'dart:ui';
import 'package:flutter/material.dart';
import 'controller/HomeController.dart';
import 'package:get/get.dart';
import 'models/Course.dart';

class DetailPage extends StatelessWidget {
  final Course course;
  DetailPage({Key? key, required this.course}) : super(key: key);

  Widget mycontainer(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Icon(Icons.keyboard_arrow_right_sharp)
                    ]),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffffFDF3F3),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.black, size: 12),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.white, // <-- Button color
                      onPrimary: Colors.black, // <-- Splash color
                    ),
                  ),
                ),
                SizedBox(width: 50),
                const Text(
                  "Detail Pelajaran",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
               
              ],
            ),
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Image.asset(course.picture),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 15,
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFF2994A), Color(0xFFFFF2C94C)]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            course.difficulty,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12 + 1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.brightness_1_rounded,
                            size: 10,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            course.duration,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12 + 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                course.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Overview",
                  ),
                  Tab(
                    text: "Syllabus",
                  )
                ],
                labelColor: Colors.black,
                indicatorColor: Color(0xFFFFFFB72B),
                unselectedLabelColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 500,
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(course.takeAwaySkill),
                        const SizedBox(height: 30),
                        const Text(
                          "Take - Away Skill",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(course.takeAwaySkill),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    children: [
                      mycontainer(course.syllables[0]),
                      mycontainer(course.syllables[1]),
                      mycontainer(course.syllables[2]),
                      mycontainer(course.syllables[3]),
                      mycontainer(course.syllables[4]),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
