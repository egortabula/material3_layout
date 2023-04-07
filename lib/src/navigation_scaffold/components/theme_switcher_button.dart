import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

/// A button widget that toggles the theme mode of the app.
///
/// This widget uses GetX for state management and changes the theme mode of the app
/// based on the current theme mode when it is pressed.
///
/// Example usage:
/// ```dart
/// ThemeSwitcherButton()
/// ```
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
