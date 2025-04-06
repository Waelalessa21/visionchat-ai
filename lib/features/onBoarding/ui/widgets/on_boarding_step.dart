import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/widgets/components/on_boarding_desktop.dart';
import 'package:aichatbot/common/widgets/components/on_boarding_mobile.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:aichatbot/features/onBoarding/ui/widgets/interset_grid.dart';
import 'package:aichatbot/features/onBoarding/ui/widgets/lang_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingStep extends StatelessWidget {
  final String? imageAsset;
  final String title;
  final String description;
  final Widget? content;
  final StepType type;
  final String? sampleQuestion;
  final String? sampleAnswer;

  const OnboardingStep({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    this.content,
    this.type = StepType.welcome,
    this.sampleQuestion,
    this.sampleAnswer,
  });

  factory OnboardingStep.language({
    required String imageAsset,
    required String title,
    required String description,
  }) {
    return OnboardingStep(
      imageAsset: imageAsset,
      title: title,
      description: description,
      type: StepType.language,
      content: const LanguageGrid(),
    );
  }

  factory OnboardingStep.interests({
    required String imageAsset,
    required String title,
    required String description,
  }) {
    return OnboardingStep(
      imageAsset: imageAsset,
      title: title,
      description: description,
      type: StepType.interests,
      content: const InterestGrid(),
    );
  }

  factory OnboardingStep.chatPreview({
    required String title,
    required String description,
    required String sampleQuestion,
    required String sampleAnswer,
  }) {
    return OnboardingStep(
      title: title,
      description: description,
      type: StepType.chatPreview,
      sampleQuestion: sampleQuestion,
      sampleAnswer: sampleAnswer,
      imageAsset: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return Responsive(
          mobile: MobileOnboardingStep(
            imageAsset: imageAsset,
            title: title,
            description: description,
            content: content,
            type: type,
            sampleQuestion: sampleQuestion,
            sampleAnswer: sampleAnswer,
          ),
          desktop: DesktopOnboardingStep(
            imageAsset: imageAsset,
            title: title,
            description: description,
            content: content,
            type: type,
            sampleQuestion: sampleQuestion,
            sampleAnswer: sampleAnswer,
          ),
        );
      },
    );
  }
}

enum StepType { welcome, language, interests, chatPreview }
