import 'package:flutter/material.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';

class NavigationRailSettingsModel extends NavigationSettings<DestinationModel> {
  final Widget? leading;
  final Widget? trailing;

  /// Determines whether to show a menu icon button in the navigation rail.
  final bool showMenuIcon;

  final double groupAlignment;

  final NavigationRailLabelType? labelType;

  final bool addThemeSwitcherTrailingIcon;

  NavigationRailSettingsModel({
    this.leading,
    this.trailing,
    this.showMenuIcon = false,
    this.groupAlignment = 0.0,
    this.addThemeSwitcherTrailingIcon = false,
    this.labelType,
    required super.destinations,
    required super.pages,
    super.type = NavigationTypeEnum.railAndBottomNavBar,
  })  : assert(
          destinations.length == pages.length,
          'Destinations must be the same length as pages',
        ),
        assert(
          showMenuIcon == false || leading == null,
          'Cannot provide both showMenuIcon and leading properties.',
        ),
        assert(
          !showMenuIcon ||
              labelType == null ||
              labelType == NavigationRailLabelType.none,
          'Cannot provide both showMenuIcon and labelType all or selected',
        ),
        assert(
          !(trailing != null && addThemeSwitcherTrailingIcon),
          'Cannot provide both "trailing" and "addThemeSwitcherTrailingIcon"',
        ),
        assert(
          addThemeSwitcherTrailingIcon == false || groupAlignment <= 0.0,
          'Cannot provide bottom group alignment and theme switcher button',
        );
}
