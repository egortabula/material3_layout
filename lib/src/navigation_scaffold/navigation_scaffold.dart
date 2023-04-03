import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';
import 'package:material3_layout/src/navigation_scaffold/components/bottom_nav_bar.dart';
import 'package:material3_layout/src/navigation_scaffold/components/nav_rail.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

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
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: Row(
        children: [
          _buildPrimaryNavigation(layout),
          Flexible(
            child: Obx(
              () => navigationSettings.pages[controller.selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(layout),
      drawer: _buildModalDrawer(),
    );
  }

  Widget _buildPrimaryNavigation(Layout layout) {
    if (layout == Layout.compact ||
        navigationType == NavigationTypeEnum.modalDrawer) {
      return const SizedBox.shrink();
    }
   
    return NavRail(
      settings: navigationSettings as NavigationRailSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  BottomNavBar? _buildBottomNavigationBar(Layout layout) {
    if (layout != Layout.compact ||
        navigationType == NavigationTypeEnum.modalDrawer) {
      return null;
    }
    return BottomNavBar(
      settings: navigationSettings as NavigationRailSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  Widget? _buildModalDrawer() {
    if (navigationType != NavigationTypeEnum.modalDrawer) {
      return null;
    }
    return CustomNavigationDrawer(
      settings: navigationSettings as NavigationDrawerSettingsModel,
      onDestinationSelected: onDestinationSelected,
    );
  }

  AppBar? _buildAppBar() {
    if (navigationType == NavigationTypeEnum.modalDrawer && appBar == null) {
      return AppBar();
    }
    if (appBar == null) {
      return null;
    }
    return appBar;
  }
}
