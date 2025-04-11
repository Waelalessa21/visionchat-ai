import 'dart:math' as math;

import 'package:aichatbot/common/layout/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelper {
  static double size(
    BuildContext context,
    double desktopSize,
    double tabletSize,
    double mobileSize,
  ) {
    final width = MediaQuery.of(context).size.width;

    if (Responsive.isDesktop(context)) {
      return desktopSize;
    } else if (width >= 600) {
      return tabletSize;
    } else {
      return mobileSize.w;
    }
  }

  static double fontSize(
    BuildContext context,
    double desktopSize,
    double tabletSize,
    double mobileSize,
  ) {
    final width = MediaQuery.of(context).size.width;

    if (Responsive.isDesktop(context)) {
      return desktopSize;
    } else if (width >= 600) {
      return tabletSize;
    } else {
      return mobileSize.sp;
    }
  }

  static double getContainerMaxWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = screenWidth >= 600 && !isDesktop;

    return isDesktop
        ? math.min(1200.0, screenWidth * 0.85)
        : isTablet
        ? screenWidth * 0.9
        : screenWidth * 0.95;
  }
}
