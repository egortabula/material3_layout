import 'package:flutter/material.dart';
import 'package:material3_layout/material3_layout.dart';

class NewSurfaceTheme {
  static Color getSurfaceColor(SurfaceColorEnum selectedColor, BuildContext context) {
    switch (selectedColor) {
      case SurfaceColorEnum.surface:
        return Theme.of(context).colorScheme.surface;
      case SurfaceColorEnum.surfaceContainerLowest:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          0,
        );
      case SurfaceColorEnum.surfaceContainerLow:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          1,
        );
      case SurfaceColorEnum.surfaceContainer:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          2,
        );
      case SurfaceColorEnum.surfaceContainerHigh:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          3,
        );
      case SurfaceColorEnum.surfaceContainerHighest:
        return Theme.of(context).colorScheme.surfaceVariant;
    }
  }
}
