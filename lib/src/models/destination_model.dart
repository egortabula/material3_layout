import 'package:flutter/material.dart';

class DestinationModel {
  final String label;
  final Icon? icon;
  final Icon? selectedIcon;
  final String? tooltip;
  final Badge? badge;

  DestinationModel({
    required this.label,
    this.icon,
    this.selectedIcon,
    this.tooltip,
    this.badge,
  }) : assert(
          badge == null || icon == null,
          'Only one of icon or badge should be provided, not both.',
        );

  NavigationRailDestination toNavigationRailDestination(EdgeInsets? padding) {
    if (badge != null) {
      return NavigationRailDestination(
        icon: badge!,
        label: Text(label),
        selectedIcon: badge!,
        padding: padding,
      );
    }
    return NavigationRailDestination(
      icon: icon!,
      label: Text(label),
      selectedIcon: selectedIcon,
      padding: padding,
    );
  }

  NavigationDestination toNavigationDestination() {
    if (badge != null) {
      return NavigationDestination(
        icon: badge!,
        label: label,
        selectedIcon: badge!,
      );
    }
    return NavigationDestination(
      icon: icon!,
      label: label,
      selectedIcon: selectedIcon,
      tooltip: tooltip,
    );
  }
}
