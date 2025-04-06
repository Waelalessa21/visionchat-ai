import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool responsive;

  const StartButton({
    super.key,
    required this.onPressed,
    this.responsive = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Responsive values
    final iconSize = responsive ? 20.sp : 22.0;
    final paddingH = responsive ? 24.w : 32.0;
    final paddingV = responsive ? 14.h : 18.0;
    final borderRadius = responsive ? 24.r : 24.0;

    return ElevatedButton.icon(
      key: const ValueKey('start_button'),
      onPressed: onPressed,
      icon: Text(l10n.startExploring),
      label: Icon(Icons.explore, size: iconSize),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
