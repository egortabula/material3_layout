import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScaffoldController extends GetxController {
  final ThemeData theme;

  NavigationScaffoldController(this.theme);

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;
}
