import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

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
    return Material(
      color: Get.theme.colorScheme.surface,
      surfaceTintColor: Get.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding),
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
