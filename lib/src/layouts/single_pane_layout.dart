import 'package:flutter/material.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

/// A layout that displays a single pane on the screen.
class SinglePaneLayout extends StatelessWidget with LayoutUtils, Layout {
  /// The child widget to display within this layout.
  final Widget child;

  /// The amount of vertical padding to apply to the layout.
  final double verticalPadding;

  SinglePaneLayout({
    super.key,
    this.verticalPadding = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = Breakpoints.getLayout(context);
    if (layout == LayoutEnum.compact) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        margin: layoutSpacing(verticalPadding, context),
        child: child,
      );
    }
    return Material(
      color: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding, context),
        width: double.infinity,
        height: double.infinity,
        child: child,
      ),
    );
  }
}
