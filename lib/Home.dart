import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DetailPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'FeauredClass.dart';
import 'controller/HomeController.dart';

DateTime now = DateTime.now();
final Waktu = DateTime.parse(now.toString());
final pagecontrol = PageController();

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final page = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        page.greet.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      )),
                  const Text(
                    "Welcome, Alex",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ]),
            InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('asset/Logo.png', height: 40),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Obx(() => TextField(
                controller: page.storeNameEditingController.value,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Cari Disini',
                    hintStyle: const TextStyle(color: Colors.grey)),
              )),
        ),
        SizedBox(height: 30),
        Container(
          height: 270,
          child: PageView(
            controller: pagecontrol,
            children: [
              Obx(() => InkWell(
                    onTap: () {
                      Get.to(DetailPage(course: page.favoriteCourse[0]));
                    },
                    child: FeaturedClass(
                      course: page.favoriteCourse[0],index: 0,
                    ),
                  )),
              Obx(() => InkWell(
                    onTap: () {
                      Get.to(DetailPage(course: page.favoriteCourse[1]));

                    },
                    child: FeaturedClass(
                      course: page.favoriteCourse[1],index: 1,
                    ),
                  )),
              Obx(() => InkWell(
                onTap: () {
                      Get.to(DetailPage(course: page.favoriteCourse[2]));

                    },
                child: FeaturedClass(
                      course: page.favoriteCourse[2],index: 2,
                    ),
              )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
            child: SmoothPageIndicator(
                controller: pagecontrol,
                count: 3,
                effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Color(0xFFFFFFB72B),
                    spacing: 15))),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Kursus Populer",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 80,
                height: 20,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Colors.grey),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            PopularClass(),
            PopularClass(),
          ],
        )
        
      ],
    );
  }
}


class PopularClass extends StatelessWidget {
  const PopularClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image: const DecorationImage(
                    image: AssetImage('asset/AnalyzeData.png'),
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
                    'Skill Path',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    'Analisa Data (Python)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Pemula',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.brightness_1_rounded,
                        size: 10,
                        color: Color(0xFFFFFFB72B),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "12 Pelajaran",
                        style: TextStyle(
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
    );
  }
}