import 'package:flutter/widgets.dart';
import 'package:material3_layout/material3_layout.dart';

abstract class NavigationSettings<T> {
  final List<Widget> pages;
  final List<T> destinations;
  final NavigationTypeEnum type;

  NavigationSettings({
     required this.pages,
     required this.destinations,
    required this.type,
  });
}
