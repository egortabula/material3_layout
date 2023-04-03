import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

class ThemeSwitcherButton extends GetView<NavigationScaffoldController> {
  const ThemeSwitcherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Get.isDarkMode
          ? const Icon(Icons.light_mode)
          : const Icon(Icons.dark_mode),
      onPressed: () {
        Get.changeThemeMode(
          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
        );
      },
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
        side: BorderSide(
          color: controller.theme.colorScheme.outline,
        ),
      ),
    );
  }
}
