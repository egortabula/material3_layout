import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/breakpoints.dart';
import 'package:material3_layout/src/layouts/layout.dart';


/// A widget that displays a different layout based on the screen size.
class PageLayout extends StatelessWidget {
  /// The layout to use when the screen size is compact.
  /// Typically `SinglePaneLayout`
  final Layout compactLayout;

  /// The layout to use when the screen size is medium.
  /// 
  /// Tipically `SinglePaneLayout`, but in some case `SplitPaneLayout` or `TwoPaneLayout`
  final Layout? mediumLayout;

  /// The layout to use when the screen size is extended.
  /// 
  /// Typically `TwoPaneLayout`. but it can be `SinglePaneLayout` or `SplitPaneLayout``
  final Layout? extendedLayout;

  const PageLayout({
    Key? key,
    required this.compactLayout,
    required this.mediumLayout,
    required this.extendedLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layout = Breakpoints.getLayout(context);

    if (layout == LayoutEnum.compact) {
      return compactLayout.build(context);
    }
    if (layout == LayoutEnum.medium) {
      if (GetUtils.isNull(mediumLayout)) {
        return compactLayout.build(context);
      }
      return mediumLayout!.build(context);
    }
    if (layout == LayoutEnum.expanded) {
      if (GetUtils.isNull(extendedLayout)) {
        return mediumLayout?.build(context) ?? const SizedBox.shrink();
      }
      return extendedLayout!.build(context);
    }
    throw Exception("Undefined breakpoint");
  }
}
