import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepDot extends StatelessWidget {
  final int index;
  final bool isActive;
  final bool isCompleted;
  final bool responsive;

  const StepDot({
    super.key,
    required this.index,
    required this.isActive,
    required this.isCompleted,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dotSize = responsive ? 40.0 : 48.0;
    final dotWidth = responsive ? 40.w : dotSize;
    final dotHeight = responsive ? 40.h : dotSize;
    final fontSize = responsive ? 14.sp : 16.0;
    final iconSize = responsive ? 18.sp : 22.0;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: isActive ? 1.0 : 0.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 1.0 + (value * 0.2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: dotWidth,
            height: dotHeight,
            decoration: BoxDecoration(
              color:
                  isActive
                      ? theme.colorScheme.primary
                      : isCompleted
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surfaceVariant,
              shape: BoxShape.circle,
              boxShadow:
                  isActive
                      ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ]
                      : null,
            ),
            child: Center(
              child:
                  isCompleted
                      ? Icon(
                        Icons.check,
                        color: theme.colorScheme.onPrimary,
                        size: iconSize,
                      )
                      : Text(
                        '${index + 1}',
                        style: TextStyle(
                          color:
                              isActive
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }
}
