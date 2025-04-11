import 'package:aichatbot/common/helper/extenstion.dart';
import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = Responsive.isDesktop(context);
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.waiting);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.startJourney,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: isDesktop ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.exploreSaudi,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: isDesktop ? 14 : 12,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              SizedBox(width: 4),
              Text("🚀", style: TextStyle(fontSize: isDesktop ? 16 : 14.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
