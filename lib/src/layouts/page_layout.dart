import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/breakpoints.dart';

import 'layout.dart';

class PageLayout extends StatelessWidget {
  final Layout compactLayout;
  final Layout? mediumLayout;
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
    throw Exception("Undifuned breakpoint");
  }
}
