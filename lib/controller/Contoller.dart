import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class PageControl extends GetxController {
  var nameLast = 'Next'.obs;
  var nameFirst = 'Skip'.obs;
  bool last = false;
  var pageNumber = 0.obs;

  bool OnlastPage(int page) {
    if (page == 2) {
      nameLast.value = 'Done';
      pageNumber.value = page;
      nameFirst.value = 'Previous';
      return true;
    } else if (page == 1) {
      nameLast.value = 'Next';
      pageNumber.value = page;
      nameFirst.value = 'Previous';
      last = false;
      return false;
    } else {
      nameLast.value = 'Next';
      nameFirst.value = 'Skip';
      pageNumber.value = page;
      last = false;
      return false;
    }
  }
}
