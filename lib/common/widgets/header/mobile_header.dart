import 'package:aichatbot/common/provider/language.dart';
import 'package:aichatbot/common/provider/theme.dart';
import 'package:aichatbot/common/widgets/header/header_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderSection.buildHeaderLogo(context, responsive: true),
          Row(
            children: [
              HeaderSection.buildLanguageToggle(
                context,
                localeProvider,
                responsive: true,
              ),
              SizedBox(width: 8.w),
              HeaderSection.buildThemeToggle(
                context,
                themeProvider,
                responsive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
