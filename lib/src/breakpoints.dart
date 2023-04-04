import 'package:flutter/material.dart';

class Breakpoints {
  static LayoutEnum getLayout(BuildContext context) {
    if (isCompact(context)) {
      return LayoutEnum.compact;
    } else if (isMedium(context)) {
      return LayoutEnum.medium;
    } else if (isExtended(context)) {
      return LayoutEnum.expanded;
    } else {
      throw Exception('Bad condition!');
    }
  }

  static bool isCompact(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? true : false;
  }

  static bool isMedium(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return mediaQuery.width >= 600 && mediaQuery.width < 840 ? true : false;
  }

  static bool isExtended(BuildContext context) {
    return MediaQuery.of(context).size.width > 840 ? true : false;
  }
}

enum LayoutEnum {
  compact(0, 600),
  medium(600, 840),
  expanded(840, double.infinity);

  const LayoutEnum(double? begin, double? end);
}
