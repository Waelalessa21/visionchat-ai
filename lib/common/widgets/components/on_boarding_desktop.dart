import 'package:aichatbot/features/onBoarding/ui/widgets/on_boarding_step.dart';
import 'package:flutter/material.dart';

class DesktopOnboardingStep extends StatelessWidget {
  final String? imageAsset;
  final String title;
  final String description;
  final Widget? content;
  final StepType type;
  final String? sampleQuestion;
  final String? sampleAnswer;

  const DesktopOnboardingStep({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    this.content,
    required this.type,
    this.sampleQuestion,
    this.sampleAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImageOrSpace(context),
          const SizedBox(height: 40),
          _buildTitle(context),
          const SizedBox(height: 20),
          _buildDescription(context),
          const SizedBox(height: 40),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildImageOrSpace(BuildContext context) {
    if (imageAsset == null || imageAsset!.isEmpty) {
      return const SizedBox(height: 40);
    }

    return _buildImage(context);
  }

  Widget _buildImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final width = screenWidth * 0.65;
    final height = screenHeight * 0.4;

    return Hero(
      tag: 'step_image_$type',
      child: Column(
        children: [
          SizedBox(height: 40),

          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAsset!,
                fit:
                    BoxFit
                        .cover, // Changed from contain to cover for better appearance
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescription(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (type) {
      case StepType.language:
      case StepType.interests:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: content!,
              ),
            );
          },
        );
      case StepType.chatPreview:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: _buildChatPreview(context),
              ),
            );
          },
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildChatPreview(BuildContext context) {
    if (sampleQuestion == null || sampleAnswer == null) {
      return const SizedBox();
    }

    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final maxWidth = width > 1200 ? 600.0 : 500.0;

    return Container(
      width: maxWidth,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              sampleQuestion!,
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              sampleAnswer!,
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
