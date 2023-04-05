import 'package:flutter/widgets.dart';
import 'package:material3_layout/material3_layout.dart';

/// An abstract class that defines the basic properties of a navigation settings object.
abstract class NavigationSettings<T> {
  /// A list of widget pages to be displayed.
  final List<Widget> pages;

  /// A list of destinations to be displayed in the navigation menu.
  final List<T> destinations;

  /// The type of navigation to be used.
  final NavigationTypeEnum type;

  /// Constructor that initializes the properties of the navigation settings object.
  NavigationSettings({
    required this.pages,
    required this.destinations,
    required this.type,
  });
}
