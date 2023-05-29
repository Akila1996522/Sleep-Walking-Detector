import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_walking_detector/consts/images.dart';
import 'package:sleep_walking_detector/consts/strings.dart';
import 'package:sleep_walking_detector/consts/styles.dart';
import 'package:sleep_walking_detector/controllers/home_controller.dart';
import 'package:sleep_walking_detector/views/home_screen/home_screen.dart';
import 'package:sleep_walking_detector/views/profile_screen/profile_screen.dart';

import '../../consts/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    // Init home Controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody = [
      const HomeScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() => 
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value){
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}