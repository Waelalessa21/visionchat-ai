import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/widgets/components/interset_section.dart';
import 'package:flutter/material.dart';

class InterestGrid extends StatelessWidget {
  const InterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileInterestGrid(),
      desktop: DesktopInterestGrid(),
    );
  }
}
