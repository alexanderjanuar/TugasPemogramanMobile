import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_pemo/LandingPage.dart';
import 'package:uas_pemo/RegisController.dart';

import 'controller/HomeController.dart';
import 'package:get/get.dart';

DateTime datetime = DateTime.now();
String formatter = DateFormat.yMMMMd('en_US').format(datetime);

class ProfilePage extends StatelessWidget {
  final SignInUpController signInUpController = Get.put(SignInUpController());

  ProfilePage({Key? key}) : super(key: key);

  final page = Get.put(HomeController());

  Widget ProfileForm(String name, Icon icon, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(title, style: TextStyle(color: Colors.grey)),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(),
          margin: const EdgeInsets.fromLTRB(25, 0, 30, 0),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black38,
          ))),
          child: Row(children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(name,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16)),
          ]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(height: 350),
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFFF2994A), Color(0xFFFFF2C94C)]),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('asset/Logo.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Alexander Januar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    SizedBox(height: 50),
                  ]),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(),
          margin: const EdgeInsets.fromLTRB(25, 0, 30, 0),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black38,
          ))),
          child: Text(
            "ACCOUNT",
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Obx(() => ProfileForm(signInUpController.nameController.text,
            Icon(Icons.person_outline), "Nama Panjang")),
        Obx(() => ProfileForm(signInUpController.emailController.text,
            Icon(Icons.email_outlined), "Alamat Email")),
        Obx(() => ProfileForm(signInUpController.phoneController.text,
            Icon(Icons.email_outlined), "Nomor Telepon")),
        SizedBox(height: 20),
        Container(
          height: 40,
          margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              elevation: 5.0,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.off(LandingPage());
            },
            child: Text("Log out"),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
