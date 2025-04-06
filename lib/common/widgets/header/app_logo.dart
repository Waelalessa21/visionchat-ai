import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Logo and app name to be used in different screens.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.responsive = true});

  final bool responsive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final iconSize = responsive ? 24.sp : 24.0;
    final containerWidth = responsive ? 40.w : 40.0;
    final containerHeight = responsive ? 40.h : 40.0;
    final spacerWidth = responsive ? 8.w : 12.0;
    final fontSize = responsive ? 14.sp : 18.0;

    return Row(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.explore,
              color: theme.colorScheme.onPrimary,
              size: iconSize,
            ),
          ),
        ),
        SizedBox(width: spacerWidth),
        Text(
          l10n.saudiGuide,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
