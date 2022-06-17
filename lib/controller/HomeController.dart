import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Course.dart';


class HomeController extends GetxController {
  DateTime now = DateTime.now();
  var selectedDate = DateTime.now().obs;
  var favoriteCourseLen = 0.obs;
  var selectedIndex = 0.obs;
  var greet = "".obs;
  var favoriteCourse = <Course>[
    Course(
      "Python",
      "Learn Python 3",
      "asset/PythonBG.jpg",
      "25 Hours",
      "13 Lesson",
      "Beginner",
      "Python is a general-purpose, versatile and popular programming language. Python is also a great first language because it is concise and easy to read.",
      "This course is a great introduction to both fundamental programming concepts and the Python programming language",
      ['Control Flow', 'Lists', 'Function', 'String', 'Files'],
      false,
      0,
    ),
    Course(
        "HTML",
        "Learn HTML",
        "asset/WebDev.jpeg",
        "9 Hours",
        "14 Lesson",
        "Beginner",
        "HTML is the foundation of all web pages. Without HTML, you wouldn’t be able to organize text or add images or videos to your web pages.",
        "You will learn all the common HTML tags used to structure HTML pages, the skeleton of all websites. You will also be able to create HTML tables to present tabular data efficiently.",
        ['Elements', 'Structure', 'Tables', 'Forms', 'Semantic HTML'],
        false,
        0),
    Course(
        "Swift",
        "Learn Swift",
        "asset/apple-swift.jpg",
        "25 Hours",
        "13 Lesson",
        "Beginner",
        "Swift is a powerful programming language that is easy and also fun to learn. Its code is safe by design, yet also produces software that runs lightning-fast. It is used to build apps for iOS, watchOS, macOS, tvOS, and Linux",
        "This course will start with the fundamental programming concepts before digging deeper into the more advanced Swift topics. You will build everything from a Magic 8-Ball to a Caesar Cipher.",
        ['Variables', 'Conditionals & Logic', 'Loops', 'Array/Sets', 'Classes'],
        false,
        0),
  ].obs;
  var favoriteList = <Widget>[];
  var Nama = "".obs;
  var Email = "".obs;


  var storeNameEditingController = TextEditingController().obs;
   var storeEmailEditingController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    greetings(now.hour);
  }

  void setIndex(Index) {
    selectedIndex.value = Index;
  }

  int GetIndex() {
    return selectedIndex.value;
  }

  void greetings(int time) {
    if (time >= 5 && time < 11) {
      greet.value = "Good Morning";
    } else if (time >= 11 && time < 15) {
      greet.value = "Good Day";
    } else if (time >= 15 && time < 19) {
      greet.value = "Good Afternoon";
    } else {
      greet.value = "Good Night";
    }
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year'
        );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  void setProfile(){
    storeNameEditingController.value.text = Nama.value;
    storeEmailEditingController.value.text = Email.value;
  }


  void favoriteContainer(
      String image, String title, String difficulty, String lesson) {
    favoriteList.add(Container(
      height: 120,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)),
      child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Course',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        difficulty,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
                        lesson,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
