import 'package:flutter/material.dart';

/// A model representing a single navigation destination, used in a navigation bar.
class DestinationModel {
  /// The label to be displayed for this destination.
  final String label;

  /// The icon to be displayed for this destination.
  final Widget? icon;

  /// The icon to be displayed for this destination when it is selected.
  final Widget? selectedIcon;

  /// The tooltip to be displayed for this destination.
  final String? tooltip;

  /// A badge to be displayed on top of the [icon] or [selectedIcon].
  final Badge? badge;

  /// Creates a new [DestinationModel].
  ///
  /// [label] is required, and [icon] and [selectedIcon] cannot both be non-null.
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

  /// Converts this [DestinationModel] to a [NavigationRailDestination] used in a [NavigationRail].
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

  /// Converts this [DestinationModel] to a [NavigationDestination] used in a [BottomNavigationBar].
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
