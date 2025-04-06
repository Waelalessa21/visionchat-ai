import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Message extends StatelessWidget {
  final String text;
  final bool isUser;

  const Message({required this.text, required this.isUser, super.key});

  String _processText(String text, bool isUser) {
    if (isUser) {
      return text;
    }

    return text.replaceAll('**', '');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isRTL = l10n.localeName == 'ar';
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    final alignment =
        isUser
            ? (isRTL ? Alignment.centerLeft : Alignment.centerRight)
            : (isRTL ? Alignment.centerRight : Alignment.centerLeft);

    final bubbleColor =
        isUser
            ? colorScheme.primary
            : theme.brightness == Brightness.dark
            ? colorScheme.surfaceVariant.withOpacity(0.8)
            : colorScheme.surfaceVariant;

    final textColor = isUser ? colorScheme.onPrimary : colorScheme.onSurface;

    final borderRadius =
        isUser
            ? BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(5),
            )
            : BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(18),
            );

    final adjustedBorderRadius =
        isRTL
            ? (isUser
                ? BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(18),
                )
                : BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(5),
                ))
            : borderRadius;

    final processedText = _processText(text, isUser);

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isSmallScreen ? size.width * 0.75 : size.width * 0.6,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: isSmallScreen ? 12 : 24,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: adjustedBorderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            processedText,
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontFamily: "IBMPlexSansArabic",
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
