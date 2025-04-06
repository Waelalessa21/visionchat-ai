import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSubmitted;
  final VoidCallback onSendPressed;

  const ChatInputField({
    super.key,
    required this.textController,
    required this.onSubmitted,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 40, maxHeight: 120),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  child: TextField(
                    controller: textController,
                    onSubmitted: (text) {
                      onSubmitted(text);
                    },
                    maxLines: null,
                    textAlign:
                        l10n.localeName == "en"
                            ? TextAlign.left
                            : TextAlign.right,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: "IBMPlexSansArabic",
                    ),
                    decoration: InputDecoration(
                      hintText: l10n.input_chat,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.5),
                        fontFamily: "IBMPlexSansArabic",
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      isCollapsed: true,
                    ),
                    cursorColor: colorScheme.primary,
                    cursorWidth: 2.0,
                    cursorRadius: const Radius.circular(1),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.send,
                    onEditingComplete: () {
                      if (textController.text.trim().isNotEmpty) {
                        onSubmitted(textController.text);
                      }
                    },
                  ),
                ),
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: IconButton(
                onPressed: onSendPressed,
                icon: Icon(Icons.send, color: colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
