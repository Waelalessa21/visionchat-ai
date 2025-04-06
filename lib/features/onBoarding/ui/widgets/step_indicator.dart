import 'package:aichatbot/common/widgets/components/step_indicator_components.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:aichatbot/common/layout/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return Responsive(
          mobile: StepIndicatorLayout(provider: provider, responsive: true),
          desktop: StepIndicatorLayout(provider: provider, responsive: false),
        );
      },
    );
  }
}
