import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/src/layouts/enum/fixed_pane_position_enum.dart';
import 'package:material3_layout/src/layouts/layout.dart';
import 'package:material3_layout/src/layouts/layout_utils.dart';

class TwoPaneLayout extends Layout with LayoutUtils {
  final Widget fixedPaneChild;
  final Widget flexiblePaneChild;
  final FixedPanePositionEnum fixedPanelPosition;
  const TwoPaneLayout({
    Key? key,
    required this.fixedPaneChild,
    required this.flexiblePaneChild,
    this.fixedPanelPosition = FixedPanePositionEnum.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.surface,
      surfaceTintColor: Get.theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Padding(
        padding: layoutMargin(),
        child: Builder(
          builder: (context) {
            if (isFixedPanelPositionLeft) {
              return Row(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: 360,
                    child: fixedPaneChild,
                  ),
                  SizedBox(width: paneSpacing),
                  Flexible(child: flexiblePaneChild),
                ],
              );
            } else {
              return Row(
                children: [
                  Flexible(child: flexiblePaneChild),
                  Container(
                    width: paneSpacing,
                  ),
                  SizedBox(
                    height: double.infinity,
                    width: 360,
                    child: fixedPaneChild,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  bool get isFixedPanelPositionLeft {
    return fixedPanelPosition == FixedPanePositionEnum.left ? true : false;
  }
}
