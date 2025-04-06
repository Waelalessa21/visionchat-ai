import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aichatbot/common/provider/theme.dart';

///Theme button to be used in different screen with different layout.
class ThemeToggle extends StatelessWidget {
  const ThemeToggle({
    super.key,
    required this.themeProvider,
    this.responsive = true,
  });

  final ThemeProvider themeProvider;
  final bool responsive;

  @override
  Widget build(BuildContext context) {
    if (responsive) {
      return MobileThemeToggle(themeProvider: themeProvider);
    } else {
      return DesktopThemeToggle(themeProvider: themeProvider);
    }
  }
}

class MobileThemeToggle extends StatelessWidget {
  const MobileThemeToggle({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDarkMode;

    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: themeProvider.toggleTheme,
      child: Container(
        padding: EdgeInsets.all(8.r),
        child: Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          color: isDark ? const Color(0xFF6366F1) : const Color(0xFFF59E0B),
          size: 18.sp,
        ),
      ),
    );
  }
}

class DesktopThemeToggle extends StatelessWidget {
  const DesktopThemeToggle({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final isDark = themeProvider.isDarkMode;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: themeProvider.toggleTheme,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedCrossFade(
          firstChild: Icon(
            Icons.dark_mode,
            color: const Color(0xFF6366F1),
            size: 20,
          ),
          secondChild: Icon(
            Icons.light_mode,
            color: const Color(0xFFF59E0B),
            size: 20,
          ),
          crossFadeState:
              isDark ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
