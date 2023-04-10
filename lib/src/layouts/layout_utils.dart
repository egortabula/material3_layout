import 'package:flutter/material.dart';
import 'package:material3_layout/src/breakpoints.dart';

class LayoutUtils {
  /// Horizontal margin for compact layout
  double get compactLayoutMargin => 0.0;

  /// Horizontal margin for medium layout
  double get mediumLayoutMargin => 24.0;

  /// Horizontal margin for extended layout
  double get exdendedLayoutMargin => 24.0;

  /// Spacing between panes
  double get paneSpacing => 24.0;

  /// Returns the EdgeInsetsGeometry for the given vertical and horizontal padding based on the current breakpoint.
  ///
  /// Throws an UnimplementedError if the current breakpoint is not supported.
  EdgeInsetsGeometry layoutSpacing(
      double verticalPadding, BuildContext context) {
    if (Breakpoints.isCompact(context)) {
      return EdgeInsets.symmetric(
        horizontal: compactLayoutMargin,
        vertical: verticalPadding,
      );
    } else if (Breakpoints.isMedium(context)) {
      return EdgeInsets.symmetric(
        horizontal: mediumLayoutMargin,
        vertical: verticalPadding,
      );
    } else if (Breakpoints.isExtended(context)) {
      return EdgeInsets.symmetric(
        horizontal: exdendedLayoutMargin,
        vertical: verticalPadding,
      );
    } else {
      throw UnimplementedError('Bad breakpoint');
    }
  }
}
