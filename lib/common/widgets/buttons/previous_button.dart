import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool responsive;
  final bool visible;

  const PreviousButton({
    super.key,
    required this.onPressed,
    this.responsive = true,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Responsive values
    final fontSize = responsive ? 16.sp : 16.0;
    final paddingH = responsive ? 16.w : 20.0;
    final paddingV = responsive ? 12.h : 14.0;
    final borderRadius = responsive ? 24.r : 24.0;
    final placeholderWidth = responsive ? 50.w : 100.0;

    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child:
          visible
              ? TextButton.icon(
                onPressed: onPressed,
                icon: Transform.rotate(
                  angle: l10n.localeName == "ar" ? 0 : 0,
                  child: const Icon(Icons.chevron_left, size: 22),
                ),
                label: Text(
                  l10n.previous,
                  style: TextStyle(fontSize: fontSize),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingH,
                    vertical: paddingV,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              )
              : SizedBox(width: placeholderWidth),
    );
  }
}
