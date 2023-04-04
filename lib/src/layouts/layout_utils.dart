import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/breakpoints.dart';

class LayoutUtils {
   double get compactLayoutMargin => 16.0;
   double get mediumLayoutMargin => 24.0;
   double get exdendedLayoutMargin => 24.0;
   double get paneSpacing => 24.0;

   EdgeInsetsGeometry layoutMargin() {
    if (Breakpoints.isCompact(Get.context!)) {
      return EdgeInsets.symmetric(horizontal: compactLayoutMargin);
    }
    else if (Breakpoints.isMedium(Get.context!)) {
      return EdgeInsets.symmetric(horizontal: mediumLayoutMargin);
    }
    else if  (Breakpoints.isExtended(Get.context!)) {
      return EdgeInsets.symmetric(horizontal: exdendedLayoutMargin);
    }
    else {
      throw UnimplementedError('Bad breakpoint');
    }
    
  }
}
