import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/view/home/home_screen.dart';
import 'package:quotes_app_sql/view/intro/intro1_screen.dart';
import 'package:quotes_app_sql/view/intro/intro_screen.dart';
import 'package:quotes_app_sql/view/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page:() =>  const SplashScreen()),
        // GetPage(name: '/intro', page:() => const IntroScreen()),
        // GetPage(name: '/intro1', page:() => const Intro1()),
        // GetPage(name: '/home', page:() =>  HomeScreen()),
      ],
    );
  }
}
