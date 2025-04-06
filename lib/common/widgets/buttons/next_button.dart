import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool responsive;

  const NextButton({
    super.key,
    required this.onPressed,
    this.responsive = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Responsive values
    final iconSize = responsive ? 20.sp : 22.0;
    final paddingH = responsive ? 24.w : 28.0;
    final paddingV = responsive ? 12.h : 16.0;
    final borderRadius = responsive ? 24.r : 24.0;

    return ElevatedButton.icon(
      key: const ValueKey('next_button'),
      onPressed: onPressed,
      icon: Text(l10n.next),
      label: Transform.rotate(
        angle: l10n.localeName == "ar" ? 0 : 0,
        child: Icon(Icons.chevron_right, size: iconSize),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
