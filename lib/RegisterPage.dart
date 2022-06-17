import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemo/Home.dart';
import 'package:uas_pemo/RegisController.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInUpController signInUpController = Get.put(SignInUpController());

    double width = Get.width;
    double height = Get.width;
    return Scaffold(
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LandingPage');
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
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Buat akun baru",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.deepOrange,
                ),
              )),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: TextField(
              controller: signInUpController.nameController,
              decoration: InputDecoration(
                  labelText: 'Nama Panjang',
                  labelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: TextField(
              controller: signInUpController.phoneController,
              decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  labelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: TextField(
              controller: signInUpController.emailController,
              decoration: InputDecoration(
                  labelText: 'Alamat Email',
                  labelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: TextField(
              controller: signInUpController.passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: TextField(
              controller: signInUpController.passwordConfirmController,
              decoration: InputDecoration(
                  labelText: 'Re type Password',
                  labelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: width,
            height: height / 7,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.deepOrange,
                elevation: 10.0,
              ),
              onPressed: () async {
                if (signInUpController.validateSignUp()) {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: signInUpController.emailController.text.trim(),
                      password: signInUpController.passwordController.text,
                    );
                    Navigator.pushNamed(context, '/HomePage');
                  } on FirebaseAuthException catch (e) {
                    Get.dialog(
                      AlertDialog(
                        content: Text(e.message!),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/RegisterPage');
                            },
                            child: const Text("Tutup"),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: Text("Daftar"),
            ),
          )
        ],
      ),
    );
  }
}
