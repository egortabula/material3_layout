import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

class SinglePaneLayout extends Layout with LayoutUtils {
  final Widget child;
  const SinglePaneLayout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = Breakpoints.getLayout(context);
    if (layout == LayoutEnum.compact) {
      return Container(
        margin: layoutMargin(),
        child: Flexible(
          child: child,
        ),
      );
    }
    return Material(
      color: Get.theme.colorScheme.surface,
      surfaceTintColor: Get.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutMargin(),
        child: Flexible(
          child: child,
        ),
      )
    );
  }
}
