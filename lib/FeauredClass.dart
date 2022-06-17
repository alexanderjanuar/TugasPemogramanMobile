import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:get/get.dart';
import 'controller/HomeController.dart';
import 'models/Course.dart';

class FeaturedClass extends StatelessWidget {
  final Course course;
  final int index;
  final page = Get.put(HomeController());

  FeaturedClass({Key? key, required this.course, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(course.picture),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${course.lesson}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.brightness_1_rounded,
                    size: 10,
                    color: Color(0xFFFFFFB72B),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${course.duration}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 90),
                  LikeButton(
                    onTap: onLikeButtonTapped,
                    isLiked: course.isLiked,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked == false) {
      page.favoriteCourseLen.value += 1;
      course.isLiked = true;
      page.favoriteContainer(
          course.picture, course.title, course.difficulty, course.lesson);
      course.index = (page.favoriteList.length)-1;
      Get.snackbar(
              "Added!!",
               "Course has been added to the favorites list",
               icon: Icon(Icons.add, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color(0xFFFFFFB72B),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               duration: Duration(seconds: 1),
               );
    }
    if (isLiked == true) {
      page.favoriteCourseLen--;
      course.isLiked = false;
      page.favoriteList.removeAt(course.index);
      Get.snackbar(
              "Deleted!!",
               "Course has been deleted from the favorites list",
               icon: Icon(Icons.add, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.redAccent,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               duration: Duration(seconds: 1),
               );
    }
    return !isLiked;
  }
}
