import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

/// A layout that displays a single pane on the screen.
class SinglePaneLayout extends Layout with LayoutUtils {
  /// The child widget to display within this layout.
  final Widget child;

  /// The amount of vertical padding to apply to the layout.
  final double verticalPadding;

  const SinglePaneLayout(
    this.child, {
    Key? key,
    this.verticalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = Breakpoints.getLayout(context);
    if (layout == LayoutEnum.compact) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        margin: layoutSpacing(verticalPadding),
        child: child,
      );
    }
    return Material(
      color: Get.theme.colorScheme.surface,
      surfaceTintColor: Get.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding),
        width: double.infinity,
        height: double.infinity,
        child: child,
      ),
    );
  }
}
