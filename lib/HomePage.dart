import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'FavoritePage.dart';
import 'ProfilePage.dart';
import 'Catalog.dart';
import 'Home.dart';
import 'controller/HomeController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _pageController = PageController();
  final page = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffFDF3F3),
        body: PageView(
          controller: _pageController,
          children: [
            Home(),
            Favorite(),
            Catalog(),
            ProfilePage(),
          ],
          onPageChanged: (index) {
            page.setIndex(index);
          },
        ),
        bottomNavigationBar: Obx(
          () => BottomBar(
              onTap: (int index) {
                page.setIndex(index);

                _pageController.jumpToPage(page.GetIndex());
              },
              items: <BottomBarItem>[
                BottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Colors.blue,
                ),
                BottomBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  activeColor: Colors.red,
                  darkActiveColor: Colors.red.shade400, // Optional
                ),
                BottomBarItem(
                  icon: Icon(Icons.list),
                  title: Text('Catalog'),
                  activeColor: Colors.orange,
                ),
                BottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Account'),
                  activeColor: Colors.greenAccent.shade700,
                  darkActiveColor: Colors.greenAccent.shade400, // Optional
                ),
              ],
              selectedIndex: page.selectedIndex.value),
        ));
  }
}
