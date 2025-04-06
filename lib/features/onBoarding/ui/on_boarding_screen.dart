import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/widgets/header/mobile_header.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:aichatbot/features/onBoarding/ui/widgets/buttons.dart';
import 'package:aichatbot/common/widgets/header/desktop_header.dart';
import 'package:aichatbot/features/onBoarding/ui/widgets/on_boarding_step.dart';
import 'package:aichatbot/features/onBoarding/ui/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop = Responsive.isDesktop(context);

    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                Responsive(
                  mobile: const MobileHeader(),
                  desktop: const DesktopHeader(),
                ),

                SizedBox(height: isDesktop ? 20 : 10.h),

                const StepIndicator(),

                Expanded(
                  child: Consumer<OnboardingProvider>(
                    builder: (context, provider, _) {
                      return Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              isDesktop
                                  ? MediaQuery.of(context).size.width * 0.9
                                  : double.infinity,
                        ),
                        child: PageView(
                          controller: provider.pageController,
                          physics:
                              provider.swipeEnabled
                                  ? const BouncingScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                          onPageChanged: provider.setCurrentStep,
                          children: [
                            OnboardingStep(
                              imageAsset: 'assets/images/riyad-expo2030.jpg',
                              title: l10n.welcomeTitle,
                              description: l10n.welcomeDescription,
                            ),
                            OnboardingStep.language(
                              imageAsset: '',
                              title: l10n.languageSelectionTitle,
                              description: l10n.languageSelectionDescription,
                            ),
                            OnboardingStep.interests(
                              imageAsset: '',
                              title: l10n.personalizationTitle,
                              description: l10n.personalizationDescription,
                            ),
                            OnboardingStep.chatPreview(
                              title: l10n.readyTitle,
                              description: l10n.readyDescription,
                              sampleQuestion: l10n.sampleQuestion,
                              sampleAnswer: l10n.sampleAnswer,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const NavigationButtons(),

                SizedBox(height: isDesktop ? 24 : 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
