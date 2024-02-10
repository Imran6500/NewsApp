import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/bottomNavController.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 5, left: 0),
          width: 200,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    controller.index.value = 0;
                    // print("first index ${controller.index.value}");
                  },
                  child: Obx(
                    () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        height: 55,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                        child: const Icon(Icons.home)),
                  )),
              InkWell(
                  onTap: () {
                    controller.index.value = 1;
                    // print("second index ${controller.index.value}");
                  },
                  child: Obx(
                    () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        height: 55,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 1
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                        child: const Icon(Icons.book)),
                  )),
              InkWell(
                  onTap: () {
                    controller.index.value = 2;
                    // print("third index ${controller.index.value}");
                  },
                  child: Obx(
                    () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        height: 55,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 2
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                        child: const Icon(Icons.settings)),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
