import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

import '../../../material3_layout.dart';

class BottomNavBar extends GetView<NavigationScaffoldController> {
  final List<DestinationModel> destinations;
  final void Function(int)? onDestinationSelected;

  const BottomNavBar({
    Key? key,
    required this.destinations,
    this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationBar(
        destinations:
            destinations.map((e) => e.toNavigationDestination()).toList(),
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
