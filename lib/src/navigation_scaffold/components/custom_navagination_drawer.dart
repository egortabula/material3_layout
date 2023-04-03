import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

class CustomNavigationDrawer extends GetView<NavigationScaffoldController> {
  final NavigationDrawerSettingsModel settings;
  final void Function(int)? onDestinationSelected;

  const CustomNavigationDrawer({
    Key? key,
    required this.settings,
    this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationDrawer(
        selectedIndex: controller.selectedIndex,
        onDestinationSelected: (int index) {
          if (onDestinationSelected != null) {
            onDestinationSelected!(index);
          }
          controller.selectedIndex = index;
          Get.back();
        },
        children: settings.destinations,
      );
    });
  }

  static Widget drawerTitle(String title) {
    return _NavigationDrawerTitle(title);
  }

  static Widget sectionHeader(String title) {
    return _NavigationDraweHeader(title);
  }

  static Widget sectionDivider() {
    return const _NavigationDrawerDivider();
  }
}

class _NavigationDrawerTitle extends GetView<NavigationScaffoldController> {
  final String title;
  const _NavigationDrawerTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28.0, 18.0, 8.0, 18.0),
      child: Text(
        title,
        style: controller.theme.textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _NavigationDraweHeader extends GetView<NavigationScaffoldController> {
  final String label;
  const _NavigationDraweHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28.0, 18.0, 8.0, 18.0),
      child: Text(
        label,
        style: controller.theme.textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _NavigationDrawerDivider extends GetView<NavigationScaffoldController> {
  const _NavigationDrawerDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 28,
      endIndent: 28,
      height: 1,
      thickness: 1,
      color: controller.theme.colorScheme.outlineVariant,
    );
  }
}
