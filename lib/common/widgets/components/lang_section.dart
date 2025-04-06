import 'package:aichatbot/common/provider/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguageOption extends StatelessWidget {
  const LanguageOption({
    super.key,
    required this.language,
    required this.langCode,
    this.responsive = true,
  });

  final String language;
  final String langCode;
  final bool responsive;

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isSelected = localeProvider.locale.languageCode == langCode;
    final theme = Theme.of(context);

    final borderRadius = responsive ? 12.r : 16.0;
    final fontSize = responsive ? 12.sp : 16.0;
    final iconSize = responsive ? 14.sp : 20.0;
    final spacerWidth = responsive ? 6.w : 10.0;
    final blurRadius =
        isSelected ? (responsive ? 8.0 : 10.0) : (responsive ? 4.0 : 5.0);
    final offsetY = responsive ? 2.0 : 3.0;
    final borderWidth = responsive ? 1.0 : 1.5;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color:
                        isSelected
                            ? theme.colorScheme.primary.withOpacity(0.3)
                            : theme.shadowColor.withOpacity(0.1),
                    blurRadius: blurRadius,
                    offset: Offset(0, offsetY),
                  ),
                ],
                border: Border.all(
                  color:
                      isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withOpacity(0.3),
                  width: borderWidth,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(borderRadius),
                  onTap: () => _handleLanguageSelection(context),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          language,
                          style: TextStyle(
                            fontSize: fontSize,
                            color:
                                isSelected
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                        if (isSelected) ...[
                          SizedBox(width: spacerWidth),
                          Icon(
                            Icons.check_circle,
                            size: iconSize,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleLanguageSelection(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    if (langCode == 'en' || langCode == 'ar') {
      localeProvider.setLocale(Locale(langCode));
    } else {
      final snackBar = SnackBar(
        content: Text('$language support coming soon!'),
        behavior: SnackBarBehavior.floating,
        width: !responsive ? 400 : null,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
