import 'package:aichatbot/features/soon/ui/widgets/indicator.dart';
import 'package:aichatbot/features/soon/ui/widgets/logo.dart';
import 'package:aichatbot/features/soon/ui/widgets/notify_me.dart';
import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:aichatbot/features/soon/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class WaitingScreenContent extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const WaitingScreenContent({super.key, required this.pulseAnimation});

  @override
  Widget build(BuildContext context) {
    final containerMaxWidth = ResponsiveHelper.getContainerMaxWidth(context);

    return Container(
      constraints: BoxConstraints(maxWidth: containerMaxWidth),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.size(context, 48, 32, 24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ResponsiveHelper.size(context, 40, 30, 20)),

          WaitingScreenLogo(pulseAnimation: pulseAnimation),

          SizedBox(height: ResponsiveHelper.size(context, 48, 36, 32)),

          WaitingScreenTextContent(),

          SizedBox(height: ResponsiveHelper.size(context, 48, 40, 32)),

          WaitingScreenProgressIndicator(),

          SizedBox(height: ResponsiveHelper.size(context, 60, 50, 40)),

          WaitingScreenSignupForm(),

          SizedBox(height: ResponsiveHelper.size(context, 40, 30, 24)),
        ],
      ),
    );
  }
}
