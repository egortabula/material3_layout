import 'package:flutter/material.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';

/// The settings for the primary navigation rail in the [NavigationScaffold].
class RailAndBottomSettings extends NavigationSettings<DestinationModel> {
  /// An optional widget to display as the leading widget in the navigation rail.
  final Widget? leading;

  /// An optional widget to display as the trailing widget in the navigation rail.
  final Widget? trailing;

  /// Determines whether to show a menu icon button in the navigation rail.
  final bool showMenuIcon;

  /// The alignment of the navigation rail groups. -1.0 for top, 0.0 for center, and 1.0 for bottom.
  final double groupAlignment;

  /// The type of label to display for the navigation rail destinations.
  final NavigationRailLabelType? labelType;

  /// Determines whether to add a theme switcher button as the trailing widget in the navigation rail.
  final bool addThemeSwitcherTrailingIcon;

  /// Creates a new [RailAndBottomSettings].
  ///
  /// [leading] - An optional widget to display as the leading widget in the navigation rail.
  ///
  /// [trailing] - An optional widget to display as the trailing widget in the navigation rail.
  ///
  /// [showMenuIcon] - Determines whether to show a menu icon button in the navigation rail.
  ///
  /// [groupAlignment] - The alignment of the navigation rail groups. -1.0 for top, 0.0 for center, and 1.0 for bottom.
  ///
  /// [labelType] - The type of label to display for the navigation rail destinations.
  ///
  /// [addThemeSwitcherTrailingIcon] - Determines whether to add a theme switcher button as the trailing widget in the navigation rail.
  ///
  /// [destinations] - The list of [DestinationModel] objects to display in the navigation rail.
  ///
  /// [pages] - The list of [Widget] objects that correspond to each [DestinationModel] in the [destinations] list.
  RailAndBottomSettings(
      {this.leading,
      this.trailing,
      this.showMenuIcon = false,
      this.groupAlignment = 0.0,
      this.addThemeSwitcherTrailingIcon = false,
      this.labelType,
      required super.destinations,
      required super.pages,
      super.type = NavigationTypeEnum.railAndBottomNavBar}) {
    assert(
      destinations.length == pages.length,
      'Destinations must be the same length as pages',
    );
    assert(
      showMenuIcon == false || leading == null,
      'Cannot provide both showMenuIcon and leading properties.',
    );
    assert(
      !showMenuIcon ||
          labelType == null ||
          labelType == NavigationRailLabelType.none,
      'Cannot provide both showMenuIcon and labelType all or selected',
    );
    assert(
      !(trailing != null && addThemeSwitcherTrailingIcon),
      'Cannot provide both "trailing" and "addThemeSwitcherTrailingIcon"',
    );
    assert(
      addThemeSwitcherTrailingIcon == false || groupAlignment <= 0.0,
      'Cannot provide bottom group alignment and theme switcher button',
    );
  }
}
