import 'package:aichatbot/features/onBoarding/ui/widgets/on_boarding_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileOnboardingStep extends StatelessWidget {
  final String? imageAsset;
  final String title;
  final String description;
  final Widget? content;
  final StepType type;
  final String? sampleQuestion;
  final String? sampleAnswer;

  const MobileOnboardingStep({
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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          _buildImageOrSpace(),
          SizedBox(height: 24.h),
          _buildTitle(context),
          SizedBox(height: 12.h),
          _buildDescription(context),
          SizedBox(height: 24.h),
          _buildContent(context),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildImageOrSpace() {
    if (imageAsset == null || imageAsset!.isEmpty) {
      return SizedBox(height: 20.h);
    }

    return _buildImage();
  }

  Widget _buildImage() {
    return Hero(
      tag: 'step_image_$type',
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(imageAsset!, fit: BoxFit.cover),
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
            offset: Offset(0, 20 * (1 - value)),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
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
            offset: Offset(0, 20 * (1 - value)),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
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
                offset: Offset(0, 20 * (1 - value)),
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
                offset: Offset(0, 20 * (1 - value)),
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

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              sampleQuestion!,
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              sampleAnswer!,
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
