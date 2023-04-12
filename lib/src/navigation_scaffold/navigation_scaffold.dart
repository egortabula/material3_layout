import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/models/navigation_settings.dart';
import 'package:material3_layout/src/navigation_scaffold/components/nav_rail.dart';
import 'package:material3_layout/src/navigation_scaffold/navigation_scaffold_controller.dart';
import 'package:material3_layout/src/theme/new_surface_theme.dart';

import 'components/bottom_nav_bar.dart';

/// A wrapper around a regular [Scaffold] widget, providing adaptive Material Design 3 layout.
///
/// [NavigationScaffold] allows you to choose a primary navigation type for your app, which can be either rail navigation along with a navigation bar for small screens, modal drawer, or a standard drawer. The primary navigation displayed depends on the screen size.
///
/// All you need to do is select the primary navigation type and pass in the [navigationSettings]. You don't have to worry about the [selectedIndex] parameter in [NavRail], [BottomNavBar], or [CustomNavigationDrawer], as it is handled automatically.
///
/// For more information on Material Design 3 layout, refer to the [Understanding Layout Overview](https://m3.material.io/foundations/layout/understanding-layout/overview) page.
///
/// Example usage:
///
/// ```dart
/// NavigationScaffold(
///   navigationSettings: myNavigationSettings,
///   theme: Theme.of(context),
///   onDestinationSelected: (index) {
///       log('current page: ${index}');
///   },
/// )
/// ```
class NavigationScaffold extends GetView<NavigationScaffoldController> {
  /// A callback function that is called when a destination is selected in the primary
  /// navigation rail or bottom navigation bar or modal drawer.
  final void Function(int)? onDestinationSelected;

  /// The theme to use for the app.
  ///
  /// Just pass `Theme.of(context)`
  final ThemeData theme;

  /// An optional app bar to display at the top of the screen.
  final AppBar? appBar;

  /// The primary navigation type to display.
  final NavigationTypeEnum navigationType;

  /// The settings for the navigation rail, bottom navigation bar, and other UI components.
  /// If you want use navigation rail in medium and extended screen and navigation bar in compact screens pass the `PrimaryNavigationSettingsModel`.
  ///
  /// If you want use modal drawer, as primary navigation in your app, than pass `RailAndBottomSettings`
  final NavigationSettings navigationSettings;

  /// Creates a new [NavigationScaffold] widget.
  ///
  /// The [navigationSettings] parameter must be provided.
  ///
  /// The [navigationType] parameter specifies the type of primary navigation to display. By default, it is set to [NavigationTypeEnum.railAndBottomNavBar].
  ///
  /// The [theme] parameter specifies the theme to use for the app. By default, it uses the current theme.
  ///
  /// The [appBar] parameter specifies the app bar to display at the top of the screen. By default, it is null.
  ///
  /// Throws an [AssertionError] if the [navigationSettings.type] is not equal to the [navigationType].
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
      backgroundColor:
          NewSurfaceTheme.getSurfaceColor(SurfaceColorEnum.surface, context),
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
        settings: navigationSettings as DrawerSettings,
        onDestinationSelected: onDestinationSelected,
      );
    }

    return NavRail(
      settings: navigationSettings as RailAndBottomSettings,
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
      settings: navigationSettings as RailAndBottomSettings,
      onDestinationSelected: onDestinationSelected,
    );
  }

  Widget? _buildModalDrawer() {
    if (navigationType == NavigationTypeEnum.railAndBottomNavBar) {
      return null;
    }
    if (navigationType == NavigationTypeEnum.drawer) {
      return null;
    }

    return CustomNavigationDrawer(
      settings: navigationSettings as DrawerSettings,
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
