import 'package:flutter/material.dart';
import 'package:material3_layout/src/theme/new_surface_theme.dart';
import 'package:material3_layout/src/theme/surface_color_enum.dart';

class PaneContainerWidget extends StatelessWidget {
  final Widget child;
  final SurfaceColorEnum surfaceColor;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final double borderRadius;
  const PaneContainerWidget({
    Key? key,
    required this.child,
    this.surfaceColor = SurfaceColorEnum.surface,
    this.padding = EdgeInsets.zero,
    this.height = double.infinity,
    this.width = double.infinity,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: NewSurfaceTheme.getSurfaceColor(surfaceColor, context),
        borderRadius:  BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
