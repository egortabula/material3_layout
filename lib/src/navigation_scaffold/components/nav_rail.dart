import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

import 'theme_switcher_button.dart';

/// Widget that builds the navigation rail of the NavigationScaffold.
class NavRail extends GetView<NavigationScaffoldController> {
  /// The primary navigation settings for the navigation rail.
  final RailAndBottomSettings settings;

  /// A callback function that is called when a destination is selected.
  final void Function(int)? onDestinationSelected;

  const NavRail({
    Key? key,
    required this.settings,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (state) => Stack(
        children: [
          NavigationRail(
            backgroundColor: ElevationOverlay.applySurfaceTint(
              Get.theme.colorScheme.surface,
              Get.theme.colorScheme.surfaceTint,
              2,
            ),
            groupAlignment: settings.groupAlignment,
            labelType: settings.labelType,
            leading: _buildLeading(state),
            trailing: settings.trailing,
            extended: state.value,
            destinations: railDestinations,
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: (int index) {
              if (onDestinationSelected != null) {
                onDestinationSelected!(index);
              }
              controller.selectedIndex = index;
            },
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Visibility(
              visible: settings.addThemeSwitcherTrailingIcon,
              child: const ThemeSwitcherButton(),
            ),
          ),
        ],
      ),
      false.obs,
    );
  }

  /// Builds the leading widget of the navigation rail.
  ///
  /// If [settings.leading] is not null, it returns that widget. Otherwise, it
  /// returns an IconButton with the menu or menu_open icon depending on the
  /// state of the [state].
  Widget? _buildLeading(RxBool state) {
    if (settings.leading != null) {
      return settings.leading!;
    } else if (settings.showMenuIcon) {
      return IconButton(
        onPressed: state.toggle,
        icon: Icon(state.isFalse ? Icons.menu : Icons.menu_open),
      );
    } else {
      return null;
    }
  }

  /// Converts the [settings.destinations] into a list of
  /// [NavigationRailDestination]s.
  ///
  /// This method maps each destination in [settings.destinations] to a
  /// [NavigationRailDestination] using the
  /// [toNavigationRailDestination] extension method. If the index of the
  /// destination is 0 and [settings.groupAlignment] is -1, it sets the top
  /// margin to 28. If the index is the last in the list and
  /// [settings.groupAlignment] is 1.0, it sets the bottom margin to 56. If
  /// neither of these conditions is met, it does not set a margin.
  List<NavigationRailDestination> get railDestinations {
    return List.generate(settings.destinations.length, (index) {
      if (index == 0 && settings.groupAlignment == -1) {
        return (settings.destinations[index])
            .toNavigationRailDestination(const EdgeInsets.only(top: 28));
      } else if (index == settings.destinations.length - 1 &&
          settings.groupAlignment == 1.0) {
        return (settings.destinations[index]).toNavigationRailDestination(
          const EdgeInsets.only(bottom: 56),
        );
      } else {
        return (settings.destinations[index]).toNavigationRailDestination(null);
      }
    });
  }
}
