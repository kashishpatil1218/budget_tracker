import 'dart:async';

import 'package:flutter/material.dart';

import '../../controller/user_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        usercontroller.registerUser(
            'deep patel', 'pateldeep123@gmail.com', '123654789', '20');
        usercontroller.fetchUserdata();
        Navigator.of(context).pushReplacementNamed('/bottom');
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 90),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/img/splashh_img.jpg'),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 280, right: 50, left: 50),
                child: Image(image: AssetImage('asset/img/slash_text.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
