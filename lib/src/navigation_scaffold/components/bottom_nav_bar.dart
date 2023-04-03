import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

class BottomNavBar extends GetView<NavigationScaffoldController> {
  final NavigationRailSettingsModel settings;
  final void Function(int)? onDestinationSelected;

  const BottomNavBar({
    Key? key,
    required this.settings,
    this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationBar(
        destinations: settings.destinations
            .map((e) => (e).toNavigationDestination())
            .toList(),
        selectedIndex: controller.selectedIndex,
        onDestinationSelected: (int index) {
          if (onDestinationSelected != null) {
            onDestinationSelected!(index);
          }
          controller.selectedIndex = index;
        },
      );
    });
  }
}
