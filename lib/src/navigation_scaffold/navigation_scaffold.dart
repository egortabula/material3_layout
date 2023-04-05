import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';
import 'package:material3_layout/src/navigation_scaffold/components/nav_rail.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

import 'components/bottom_nav_bar.dart';

class NavigationScaffold extends GetView<NavigationScaffoldController> {
  final void Function(int)? onDestinationSelected;
  final ThemeData theme;
  final AppBar? appBar;
  
  final NavigationTypeEnum navigationType;
  final NavigationSettings navigationSettings;

  NavigationScaffold({
    super.key,
    this.onDestinationSelected,
    this.navigationType = NavigationTypeEnum.railAndBottomNavBar,
    required this.navigationSettings,
    required this.theme,
    this.appBar,
  }) : assert(
          navigationSettings.type == navigationType,
          'Wrong navigationType. NavigationType must be the same as in navigationSettings',
        );

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationScaffoldController(theme));
    var layout = Breakpoints.getLayout(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      drawerScrimColor: theme.colorScheme.scrim.withOpacity(0.3),
      appBar: _buildAppBar(layout),
      body: SafeArea(
        child: Row(
          children: [
            _buildPrimaryNavigation(layout),
            Flexible(
              child: Obx(
                () => navigationSettings.pages[controller.selectedIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(layout),
      drawer: _buildModalDrawer(),
    );
  }

  Widget _buildPrimaryNavigation(LayoutEnum layout) {
    if (layout == LayoutEnum.compact) {
      return const SizedBox.shrink();
    }
    if (navigationType == NavigationTypeEnum.modalDrawer) {
      return const SizedBox.shrink();
    }
    if (navigationType == NavigationTypeEnum.drawer) {
      return CustomNavigationDrawer(
        settings: navigationSettings as NavigationDrawerSettingsModel,
        onDestinationSelected: onDestinationSelected,
      );
    }

    return NavRail(
      settings: navigationSettings as PrimaryNavigationSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  BottomNavBar? _buildBottomNavigationBar(LayoutEnum layout) {
    if (layout != LayoutEnum.compact ||
        navigationType == NavigationTypeEnum.modalDrawer ||
        navigationType == NavigationTypeEnum.drawer) {
      return null;
    }
    return BottomNavBar(
      settings: navigationSettings as PrimaryNavigationSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  Widget? _buildModalDrawer() {
    if (navigationType == NavigationTypeEnum.railAndBottomNavBar) {
      return null;
    }

    return CustomNavigationDrawer(
      settings: navigationSettings as NavigationDrawerSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  AppBar? _buildAppBar(LayoutEnum layout) {
    if (appBar != null) {
      return appBar;
    }
    if (navigationType == NavigationTypeEnum.modalDrawer) {
      return AppBar(
        elevation: 2,
      );
    }
    if (navigationType == NavigationTypeEnum.drawer &&
        layout == LayoutEnum.compact) {
      return AppBar(
        elevation: 2,
      );
    }

    return null;
  }
}
