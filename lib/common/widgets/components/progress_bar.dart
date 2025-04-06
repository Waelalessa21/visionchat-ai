import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final OnboardingProvider provider;
  final bool responsive;

  const ProgressBar({
    super.key,
    required this.provider,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (provider.currentStep + 1) / 4;

    final height = responsive ? 6.h : 8.0;
    final borderRadius =
        responsive ? BorderRadius.circular(3.r) : BorderRadius.circular(4);
    final width =
        responsive ? double.infinity : MediaQuery.of(context).size.width * 0.75;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          AnimatedFractionallySizedBox(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primaryContainer,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
