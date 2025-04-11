import 'dart:math' as math;
import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class WaitingScreenProgressIndicator extends StatelessWidget {
  const WaitingScreenProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: ResponsiveHelper.size(
        context,
        math.min(300, screenWidth * 0.3),
        math.min(280, screenWidth * 0.5),
        math.min(250, screenWidth * 0.7),
      ),
      child: LinearProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        minHeight: ResponsiveHelper.size(context, 8, 6, 4),
      ),
    );
  }
}
