import 'package:flutter/material.dart';

class DestinationModel {
  final String label;
  final Icon icon;
  final Icon? selectedIcon;
  final String? tooltip;

  DestinationModel({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.tooltip,
  });

  NavigationRailDestination toNavigationRailDestination(EdgeInsets? padding) {
    return NavigationRailDestination(
      icon: icon,
      label: Text(label),
      selectedIcon: selectedIcon,
      padding: padding,
    );
  }

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      label: label,
      selectedIcon: selectedIcon,
      tooltip: tooltip,
    );
  }

  NavigationDrawerDestination toNavigationDrawerDestination() {
    return NavigationDrawerDestination(
      icon: icon,
      label: Text(label),
      selectedIcon: selectedIcon,
    );
  }
}
