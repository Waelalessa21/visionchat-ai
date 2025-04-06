import 'package:flutter/material.dart';
import 'package:aichatbot/common/provider/language.dart';
import 'package:aichatbot/common/provider/theme.dart';
import 'package:aichatbot/common/widgets/header/app_logo.dart';
import 'package:aichatbot/common/widgets/header/language_toggle.dart';
import 'package:aichatbot/common/widgets/header/theme_toggle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeaderSection {
  static Widget buildHeaderLogo(
    BuildContext context, {
    bool responsive = true,
  }) {
    return AppLogo(responsive: responsive);
  }

  static Widget buildLanguageToggle(
    BuildContext context,
    LocaleProvider localeProvider, {
    bool responsive = true,
  }) {
    return LanguageToggle(
      localeProvider: localeProvider,
      responsive: responsive,
    );
  }

  static Widget buildThemeToggle(
    BuildContext context,
    ThemeProvider themeProvider, {
    bool responsive = true,
  }) {
    return ThemeToggle(themeProvider: themeProvider, responsive: responsive);
  }
}

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLogo = true,
    this.showLanguageToggle = true,
    this.showThemeToggle = true,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool showLogo;
  final bool showLanguageToggle;
  final bool showThemeToggle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    List<Widget> headerActions = [];

    if (showThemeToggle) {
      headerActions.add(
        HeaderSection.buildThemeToggle(
          context,
          themeProvider,
          responsive: isSmallScreen,
        ),
      );
    }

    if (showLanguageToggle) {
      headerActions.add(SizedBox(width: isSmallScreen ? 8.w : 12));
      headerActions.add(
        HeaderSection.buildLanguageToggle(
          context,
          localeProvider,
          responsive: isSmallScreen,
        ),
      );
    }

    if (actions != null) {
      headerActions.add(SizedBox(width: isSmallScreen ? 8.w : 12));
      headerActions.addAll(actions!);
    }

    return AppBar(
      title:
          showLogo
              ? HeaderSection.buildHeaderLogo(
                context,
                responsive: isSmallScreen,
              )
              : title,
      actions: headerActions,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
