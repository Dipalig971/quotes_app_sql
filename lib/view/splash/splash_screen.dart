import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/view/intro/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
     Get.to(const IntroScreen());
    });
    return const Scaffold(
      backgroundColor: Color(0xff36B17B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 150),
            child: Image(image: AssetImage('assets/image/bg.png')),
          ),
          Padding(
            padding: EdgeInsets.only(left: 130),
            child: Text('Quotes App',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
