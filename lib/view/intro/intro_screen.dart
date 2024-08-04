import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/view/intro/intro1_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4EDDB),
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/quotes/img.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image(
                    image: AssetImage('assets/image/intro.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Your daily dose of \n motivation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Start each day with a dose of motivation and optimism',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Get.to(const Intro1());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xff36B17B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Text(
                      "let's get started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
