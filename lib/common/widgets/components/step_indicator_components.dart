import 'package:aichatbot/common/widgets/components/progress_bar.dart';
import 'package:aichatbot/common/widgets/components/step_dots.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepIndicatorLayout extends StatelessWidget {
  final OnboardingProvider provider;
  final bool responsive;

  const StepIndicatorLayout({
    super.key,
    required this.provider,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    final padding =
        responsive
            ? EdgeInsets.symmetric(horizontal: 24.w)
            : const EdgeInsets.symmetric(horizontal: 40, vertical: 10);
    final spacing =
        responsive ? SizedBox(height: 12.h) : const SizedBox(height: 16);

    return Padding(
      padding: padding,
      child: Column(
        children: [
          ProgressBar(provider: provider, responsive: responsive),
          spacing,
          StepDots(provider: provider, responsive: responsive),
        ],
      ),
    );
  }
}

class StepDots extends StatelessWidget {
  final OnboardingProvider provider;
  final bool responsive;

  const StepDots({super.key, required this.provider, required this.responsive});

  @override
  Widget build(BuildContext context) {
    final currentStep = provider.currentStep;
    final width =
        responsive ? double.infinity : MediaQuery.of(context).size.width * 0.75;

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return StepDot(
            index: index,
            isActive: index == currentStep,
            isCompleted: index < currentStep,
            responsive: responsive,
          );
        }),
      ),
    );
  }
}
