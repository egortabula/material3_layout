import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller class for NavigationScaffold widget.
class NavigationScaffoldController extends GetxController {
  /// The [ThemeData] used in the NavigationScaffold.
  final ThemeData theme;

  NavigationScaffoldController(this.theme);

  final _selectedIndex = 0.obs;

  /// The current selected index of the primary navigation.
  int get selectedIndex => _selectedIndex.value;

  /// Sets the current selected index of the primary navigation.
  set selectedIndex(int value) => _selectedIndex.value = value;
}
