import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DetailPage.dart';
import 'controller/HomeController.dart';

class Catalog extends StatelessWidget {
  Catalog({Key? key}) : super(key: key);

  final page = Get.put(HomeController());

  Widget CatalogList(String judul, String gambar) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 80,
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(gambar),
              radius: 25,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              judul,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffffFDF3F3),
        child: ListView(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFFF2994A), Color(0xFFFFF2C94C)])),
              child: const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Text("Catalog",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text("Language",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
            ),
            InkWell(
                onTap: () {
                  Get.to(DetailPage(course: page.favoriteCourse[0]));
                },
                child: CatalogList("Belajar Python", "asset/Python.png")),
            InkWell(
                onTap: () {
                  Get.to(DetailPage(course: page.favoriteCourse[1]));
                },
                child: CatalogList("Belajar HTML", "asset/WebDev.jpeg")),
            InkWell(
                onTap: () {
                  Get.to(DetailPage(course: page.favoriteCourse[2]));
                },
                child: CatalogList("Belajar Swift", "asset/apple-swift.jpg")),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text("Skill Path",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
            ),
            CatalogList("Analisa Data (Python)", "asset/AnalyzeData.png"),
            CatalogList("Basic Machine Learning ", "asset/Python.png"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
