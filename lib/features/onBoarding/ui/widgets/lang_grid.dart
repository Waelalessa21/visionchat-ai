import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/widgets/components/lang_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageGrid extends StatelessWidget {
  const LanguageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileLanguageGrid(),
      desktop: DesktopLanguageGrid(),
    );
  }
}

class MobileLanguageGrid extends StatelessWidget {
  const MobileLanguageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8.h,
      crossAxisSpacing: 8.w,
      childAspectRatio: 3.0,
      children: [
        LanguageOption(language: 'English', langCode: 'en', responsive: true),
        LanguageOption(language: 'العربية', langCode: 'ar', responsive: true),
        LanguageOption(language: 'Deutsch', langCode: 'de', responsive: true),
        LanguageOption(language: 'Français', langCode: 'fr', responsive: true),
        LanguageOption(language: '中文', langCode: 'zh', responsive: true),
        LanguageOption(language: '日本語', langCode: 'ja', responsive: true),
      ],
    );
  }
}

class DesktopLanguageGrid extends StatelessWidget {
  const DesktopLanguageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.75;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3,
        children: [
          LanguageOption(
            language: 'English',
            langCode: 'en',
            responsive: false,
          ),
          LanguageOption(
            language: 'العربية',
            langCode: 'ar',
            responsive: false,
          ),
          LanguageOption(
            language: 'Deutsch',
            langCode: 'de',
            responsive: false,
          ),
          LanguageOption(
            language: 'Français',
            langCode: 'fr',
            responsive: false,
          ),
          LanguageOption(language: '中文', langCode: 'zh', responsive: false),
          LanguageOption(language: '日本語', langCode: 'ja', responsive: false),
        ],
      ),
    );
  }
}
