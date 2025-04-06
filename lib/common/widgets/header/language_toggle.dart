import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aichatbot/common/provider/language.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({
    super.key,
    required this.localeProvider,
    this.responsive = true,
  });

  final LocaleProvider localeProvider;
  final bool responsive;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Get size values based on responsive flag
    final horizontalPadding = responsive ? 12.w : 16.0;
    final verticalPadding = responsive ? 8.h : 10.0;
    final borderRadius = responsive ? 20.r : 24.0;
    final fontSize = responsive ? 12.sp : 14.0;
    final blurRadius = responsive ? 6.r : 8.0;

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: localeProvider.toggleLocale,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: blurRadius,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          l10n.languageSwitch,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            fontFamily: l10n.localeName == "en" ? "share" : "IBMPlexSansArabic",
          ),
        ),
      ),
    );
  }
}
