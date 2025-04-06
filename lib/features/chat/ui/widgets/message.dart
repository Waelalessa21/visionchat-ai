import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Message extends StatelessWidget {
  final String text;
  final bool isUser;

  const Message({required this.text, required this.isUser, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    var alignment =
        isUser
            ? (l10n.localeName == 'ar'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start)
            : (l10n.localeName == 'ar'
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end);

    var textAlign = l10n.localeName == 'ar' ? TextAlign.right : TextAlign.left;
    var color = isUser ? colorScheme.primary : colorScheme.surfaceVariant;
    var fontColor = isUser ? colorScheme.onPrimary : colorScheme.onSurface;
    var padding = isUser ? 0.0 : 50.0;

    return FadeInUp(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 70),
        child: Padding(
          padding: EdgeInsets.only(right: padding),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color,
                  ),
                  child: Text(
                    text,
                    textAlign: textAlign,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: fontColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
