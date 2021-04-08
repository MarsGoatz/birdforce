import 'package:flutter/material.dart';

class ResponsiveConstants {
  static double kMdBreakpoint = 900;
  static double kSmBreakpoint = 600;

  static Axis getAxis(BuildContext context) {
    return MediaQuery.of(context).size.width < kMdBreakpoint
        ? Axis.vertical
        : Axis.horizontal;
  }

  static FlexFit getFit(BuildContext context) {
    return MediaQuery.of(context).size.width < kMdBreakpoint
        ? FlexFit.loose
        : FlexFit.tight;
  }

  static double getTitleFont(BuildContext context) {
    return MediaQuery.of(context).size.width < 365
        ? 35
        : MediaQuery.of(context).size.width < kSmBreakpoint
            ? 45
            : MediaQuery.of(context).size.width > kMdBreakpoint
                ? 100
                : 60;
  }

  static double getSubTitleFont(BuildContext context) {
    return MediaQuery.of(context).size.width < kSmBreakpoint
        ? 15
        : MediaQuery.of(context).size.width > kMdBreakpoint
            ? 25
            : 20;
  }
}
