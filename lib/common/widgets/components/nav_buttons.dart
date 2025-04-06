import 'package:aichatbot/common/helper/extenstion.dart';
import 'package:aichatbot/common/routing/routes.dart';
import 'package:aichatbot/common/widgets/buttons/next_button.dart';
import 'package:aichatbot/common/widgets/buttons/previous_button.dart';
import 'package:aichatbot/common/widgets/buttons/start_button.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileNavigationButtons extends StatelessWidget {
  final OnboardingProvider provider;

  const MobileNavigationButtons({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isLastStep = provider.isLastStep;
    final canGoBack = provider.currentStep > 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PreviousButton(
            onPressed: provider.previousStep,
            visible: canGoBack,
            responsive: true,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child:
                isLastStep
                    ? StartButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.login);
                      },
                      responsive: true,
                    )
                    : NextButton(
                      onPressed: provider.nextStep,
                      responsive: true,
                    ),
          ),
        ],
      ),
    );
  }
}

class DesktopNavigationButtons extends StatelessWidget {
  final OnboardingProvider provider;

  const DesktopNavigationButtons({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isLastStep = provider.isLastStep;
    final canGoBack = provider.currentStep > 0;
    final width = MediaQuery.of(context).size.width * 0.75;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PreviousButton(
            onPressed: provider.previousStep,
            visible: canGoBack,
            responsive: false,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child:
                isLastStep
                    ? StartButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.login);
                      },
                      responsive: false,
                    )
                    : NextButton(
                      onPressed: provider.nextStep,
                      responsive: false,
                    ),
          ),
        ],
      ),
    );
  }
}
