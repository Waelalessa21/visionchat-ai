import 'package:aichatbot/common/widgets/components/nav_buttons.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:aichatbot/common/layout/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return Responsive(
          mobile: MobileNavigationButtons(provider: provider),
          desktop: DesktopNavigationButtons(provider: provider),
        );
      },
    );
  }
}
