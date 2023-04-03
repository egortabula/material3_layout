import 'package:flutter/material.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';

class NavigationDrawerSettingsModel extends NavigationSettings<Widget> {
  NavigationDrawerSettingsModel({
    required super.pages,
    required super.destinations,
    super.type = NavigationTypeEnum.drawer,
  }) : assert(
          (destinations).whereType<NavigationDrawerDestination>().length ==
              pages.length,
          'Destinations must be the same length as pages',
        );
}
