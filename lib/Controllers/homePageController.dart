import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/navigationBar.dart';
import 'bottomNavController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    // print("controller check ${controller.pages[controller.index.value]}");
    return Scaffold(
        floatingActionButton: const MyBottomNav(),
        body: Obx(
          () => controller.pages[controller.index.value],
        ));
  }
}
