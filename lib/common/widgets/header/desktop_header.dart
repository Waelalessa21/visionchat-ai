import 'package:aichatbot/common/provider/language.dart';
import 'package:aichatbot/common/provider/theme.dart';
import 'package:aichatbot/common/widgets/header/header_sections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderSection.buildHeaderLogo(context, responsive: false),
          Row(
            children: [
              HeaderSection.buildLanguageToggle(
                context,
                localeProvider,
                responsive: false,
              ),
              const SizedBox(width: 16),
              HeaderSection.buildThemeToggle(
                context,
                themeProvider,
                responsive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
