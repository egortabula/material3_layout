import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/navigation_scaffold/components/bottom_nav_bar.dart';
import 'package:material3_layout/src/navigation_scaffold/components/nav_rail.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';

class NavigationScaffold extends GetView<NavigationScaffoldController> {
  final void Function(int)? onDestinationSelected;
  final ThemeData theme;
  final AppBar? appBar;
  final List<Widget> pages;
  final NavigationRailSettingsModel navigationRailSettings;
  final List<DestinationModel> destinations;

  /// if not null, rail and bottom nav bar will be null
  final NavigationDrawerSettingsModel? customDrawer;
  const NavigationScaffold({
    super.key,
    this.onDestinationSelected,
    required this.theme,
    this.appBar,
    required this.pages,
    required this.navigationRailSettings,
    required this.destinations,
    this.customDrawer,
  })  : assert(
          customDrawer != null || destinations.length == pages.length,
          'The lengths of destinations and pages must be equal',
        ),
        assert(
          customDrawer != null ||
              (destinations.length >= 2 && destinations.length <= 7),
          'The lengths of destination must be from 2 to 7',
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
          _buildNavigationRail(layout),
          Flexible(
            child: Obx(
              () => pages[controller.selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(layout),
      drawer: _buildNavDrawer(),
    );
  }

  Widget _buildNavigationRail(Layout layout) {
    if (layout == Layout.compact || customDrawer != null) {
      return const SizedBox.shrink();
    }
    return NavRail(
      destinations: destinations,
      settings: navigationRailSettings,
      onDestinationSelected: onDestinationSelected,
    );
  }

  BottomNavBar? _buildBottomNavigationBar(Layout layout) {
    if (layout != Layout.compact || customDrawer != null) {
      return null;
    }
    return BottomNavBar(
      destinations: destinations,
      onDestinationSelected: onDestinationSelected,
    );
  }

  Widget? _buildNavDrawer() {
    if (customDrawer == null) {
      return null;
    }
    return CustomNavigationDrawer(
      settings: customDrawer!,
      onDestinationSelected: onDestinationSelected,
    );
  }

  AppBar? _buildAppBar() {
    if (appBar != null) {
      return appBar;
    }
    return AppBar();
  }
}
