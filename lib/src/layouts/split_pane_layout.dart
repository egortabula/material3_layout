import 'package:flutter/material.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

/// A split-pane layout with two child widgets: one on the left and one on the right.
/// The child widgets are separated by a `SizedBox` with a width equal to `paneSpacing`.
class SplitPaneLayout extends StatelessWidget with LayoutUtils, Layout {
  final Widget leftChild;
  final Widget rightChild;
  final double verticalPadding;

  SplitPaneLayout({
    super.key,
    required this.leftChild,
    required this.rightChild,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Use a Material widget as the container to apply a shadow and background color.
    return Material(
      color: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding, context),
        child: Row(
          children: [
            // Use Flexible to allow the left child to take up as much space as possible.
            Flexible(child: leftChild),
            SizedBox(width: paneSpacing),
            // Use Flexible to allow the right child to take up as much space as possible.
            Flexible(child: rightChild),
          ],
        ),
      ),
    );
  }
}
