import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

/// A split-pane layout with two child widgets: one on the left and one on the right.
/// The child widgets are separated by a `SizedBox` with a width equal to `paneSpacing`.
class SplitPaneLayout extends Layout with LayoutUtils {
  final Widget leftChild;
  final Widget rightChild;
  final double verticalPadding;

  const SplitPaneLayout({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    this.verticalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a Material widget as the container to apply a shadow and background color.
    return Material(
      color: Get.theme.colorScheme.surface,
      surfaceTintColor: Get.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding),
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
