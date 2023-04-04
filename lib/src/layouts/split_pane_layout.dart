import 'package:flutter/material.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

class SplitPaneLayout extends Layout with LayoutUtils {
  final Widget leftChild;
  final Widget rightChild;
  const SplitPaneLayout({
    Key? key,
    required this.leftChild,
    required this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: controller.theme.colorScheme.surface,
      surfaceTintColor: controller.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutMargin(),
        child: Row(
          children: [
            Flexible(child: leftChild),
            SizedBox(width: paneSpacing),
            Flexible(child: rightChild),
          ],
        ),
      ),
    );
  }
}
