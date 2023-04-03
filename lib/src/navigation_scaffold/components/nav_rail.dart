import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

import 'theme_switcher_button.dart';

class NavRail extends GetView<NavigationScaffoldController> {
  final List<DestinationModel> destinations;

  final NavigationRailSettingsModel settings;
  final void Function(int)? onDestinationSelected;
  const NavRail({
    Key? key,
    required this.destinations,
  
    required this.settings,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (state) => Stack(
        children: [
          NavigationRail(
            useIndicator: true,
            backgroundColor: controller.theme.navigationRailTheme.backgroundColor,
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
              child: ThemeSwitcherButton(),
            ),
          ),
        ],
      ),
      false.obs,
    );
  }

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



  List<NavigationRailDestination> get railDestinations {
    return List.generate(destinations.length, (index) {
      if (index == 0 && settings.groupAlignment == -1) {
        return destinations[index]
            .toNavigationRailDestination(const EdgeInsets.only(top: 28));
      } else if (index == destinations.length - 1 &&
          settings.groupAlignment == 1.0) {
        return destinations[index].toNavigationRailDestination(
          const EdgeInsets.only(bottom: 56),
        );
      } else {
        return destinations[index].toNavigationRailDestination(null);
      }
    });
  }
}
