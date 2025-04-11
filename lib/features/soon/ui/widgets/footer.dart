import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WaitingScreenFooter extends StatelessWidget {
  const WaitingScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveHelper.size(context, 24, 20, 16),
        horizontal: ResponsiveHelper.size(context, 24, 20, 16),
      ),
      child: Column(
        children: [
          Text(
            l10n.estimated_launch,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveHelper.fontSize(context, 16, 15, 14),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
