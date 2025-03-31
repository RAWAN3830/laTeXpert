import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'apptheme.dart';

enum BreakpointEnum {
  mobile,
  tablet,
  desktop;

  Breakpoint get point {
    switch (this) {
      case BreakpointEnum.mobile:
        return const Breakpoint(start: 0, end: 350, name: MOBILE);
      case BreakpointEnum.tablet:
        return const Breakpoint(start: 351, end: 600, name: TABLET);
      case BreakpointEnum.desktop:
        return const Breakpoint(start: 601, end: double.infinity, name: DESKTOP);
    }
  }

  static BreakpointEnum breakpointEnum(Breakpoint currentBreakpoint) {
    if (currentBreakpoint.start == 0 && currentBreakpoint.end == 350) {
      return BreakpointEnum.mobile;
    } else if (currentBreakpoint.start == 351 && currentBreakpoint.end == 600) {
      return BreakpointEnum.tablet;
    } else if (currentBreakpoint.start == 601 && currentBreakpoint.end == double.infinity) {
      return BreakpointEnum.desktop;
    } else {
      return BreakpointEnum.mobile; // Default case
    }
  }

  static ThemeData responsiveTheme(BreakpointEnum currentBreakPoint) {
    switch (currentBreakPoint) {
      case BreakpointEnum.mobile:
        return AppTheme.mobileThemeData;
      case BreakpointEnum.tablet:
        return AppTheme.tabletThemeData;
      case BreakpointEnum.desktop:
        return AppTheme.desktopThemeData;
    }
  }
}