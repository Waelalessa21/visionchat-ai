import 'dart:math' as math;

import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class WaitingScreenLogo extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const WaitingScreenLogo({super.key, required this.pulseAnimation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = ResponsiveHelper.size(
      context,
      math.min(200, screenWidth * 0.18),
      math.min(160, screenWidth * 0.25),
      math.min(140, screenWidth * 0.35),
    );

    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Icon(
              Icons.smart_toy_outlined,
              size: iconSize * 0.5,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
    );
  }
}
