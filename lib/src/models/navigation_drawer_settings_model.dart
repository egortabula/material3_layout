import 'package:flutter/material.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';

/// A model class that contains the settings for a navigation drawer.
class NavigationDrawerSettingsModel extends NavigationSettings<Widget> {
  /// Creates a new [NavigationDrawerSettingsModel] instance.
  ///
  /// The [pages] and [destinations] parameters are required and must be the same length.
  /// The [type] parameter specifies the type of navigation settings to use.
  NavigationDrawerSettingsModel({
    required super.pages,
    required super.destinations,
    required super.type,
  }) : assert(
          (destinations).whereType<NavigationDrawerDestination>().length ==
              pages.length,
          'Destinations must be the same length as pages',
        );
}
