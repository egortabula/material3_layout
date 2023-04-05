import 'package:flutter/material.dart';
import 'package:material3_layout/src/theme/new_surface_theme.dart';
import 'package:material3_layout/src/theme/surface_color_enum.dart';

/// The [PaneContainerWidget] is a wrapper widget for widgets that are inserted inside the
/// [PageLayout]. The container allows you to select the surface background color, container
/// dimensions, and border radius.
///
/// Example of usage:
///
/// ```dart
/// PaneContainerWidget(
///   child: YourWidget(),
///   surfaceColor: SurfaceColorEnum.primaryVariant,
///   padding: EdgeInsets.all(16),
/// )
/// ```
class PaneContainerWidget extends StatelessWidget {
  /// The child widget to be wrapped with the container.
  final Widget child;

  /// The color of the surface of the container. Defaults to [SurfaceColorEnum.surface].
  final SurfaceColorEnum surfaceColor;

  /// The padding for the container's child widget. Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry padding;

  /// The width of the container. Defaults to [double.infinity].
  final double width;

  /// The height of the container. Defaults to [double.infinity].
  final double height;

  /// The border radius for the container. Defaults to 12.
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
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
