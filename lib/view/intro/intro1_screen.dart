import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/view/home/home_screen.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Text(
                'Now that you know us...',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'We also want to get to know you better',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 50),
              const Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE8F0F1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'name',
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'What is your gender identity?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: 'Female',
                items: ['Female', 'Male', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Get.to(const HomeScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Container(
                    height: 70,
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xff36B17B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  // Get.offNamed('/intro1');
                },
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: BoxDecoration(
                    // color: const Color(0xff36B17B),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Don't answer now",
                      style: TextStyle(
                          color: Color(0xff36B17B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
