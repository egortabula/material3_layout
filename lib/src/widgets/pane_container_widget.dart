import 'package:flutter/material.dart';
import 'package:material3_layout/src/theme/new_surface_theme.dart';
import 'package:material3_layout/src/theme/surface_color_enum.dart';

class PaneContainerWidget extends StatelessWidget {
  final Widget child;
  final SurfaceColorEnum surfaceColor;
  final EdgeInsetsGeometry padding;
  const PaneContainerWidget({
    Key? key,
    required this.child,
    this.surfaceColor = SurfaceColorEnum.surface,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: NewSurfaceTheme.getSurfaceColor(surfaceColor, context),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: child,
    );
  }
}
