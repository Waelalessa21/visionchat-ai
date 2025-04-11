import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WaitingScreenTextContent extends StatelessWidget {
  const WaitingScreenTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          l10n.waitingtitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(context, 20, 16, 12),
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: ResponsiveHelper.size(context, 16, 12, 8)),

        Text(
          l10n.waitingdesc,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: ResponsiveHelper.fontSize(context, 14, 13, 12),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
