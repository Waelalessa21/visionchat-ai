import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingView extends StatelessWidget {
  final bool isDesktop;
  const LandingView({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    final header = FadeInDown(
      child: Column(
        children: [
          Text(
            l10n.saudiGuide,
            style: (isDesktop
                    ? theme.textTheme.displayMedium
                    : theme.textTheme.headlineMedium)
                ?.copyWith(
                  color: colorScheme.primary,
                  fontFamily: "IBMPlexSansArabic",
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.discoverKingdom,
            style: (isDesktop
                    ? theme.textTheme.titleLarge
                    : theme.textTheme.titleMedium)
                ?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontFamily: "IBMPlexSansArabic",
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final illustration = ZoomIn(
      child: Container(
        width: screenWidth * (isDesktop ? 0.2 : 0.5),
        height: screenWidth * (isDesktop ? 0.2 : 0.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              colorScheme.primary.withOpacity(0.2),
              colorScheme.primary.withOpacity(0.6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.3),
              blurRadius: 30,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Icon(
          Icons.travel_explore,
          size: screenWidth * (isDesktop ? 0.1 : 0.25),
          color: colorScheme.onPrimary,
        ),
      ),
    );

    final description = FadeInUp(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 16),
        child: Text(
          l10n.landingDescription,
          style: (isDesktop
                  ? theme.textTheme.bodyLarge
                  : theme.textTheme.bodyMedium)
              ?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.8),
                fontFamily: "IBMPlexSansArabic",
                height: 1.6,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final button = FadeInUp(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 32,
            vertical: isDesktop ? 16 : 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 6,
          shadowColor: colorScheme.primary.withOpacity(0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.startJourneyButton,
              style: (isDesktop
                      ? theme.textTheme.titleMedium
                      : theme.textTheme.titleSmall)
                  ?.copyWith(
                    color: colorScheme.onPrimary,
                    fontFamily: "IBMPlexSansArabic",
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_ios,
              color: colorScheme.onPrimary,
              size: isDesktop ? 20 : 16,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: isDesktop ? 1200 : 500),
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 48 : 24,
                vertical: 32,
              ),
              child:
                  isDesktop
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: illustration),
                          const SizedBox(width: 48),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                header,
                                const SizedBox(height: 30),
                                description,
                                const SizedBox(height: 30),
                                button,
                              ],
                            ),
                          ),
                        ],
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          header,
                          const SizedBox(height: 24),
                          illustration,
                          const SizedBox(height: 32),
                          description,
                          const SizedBox(height: 32),
                          button,
                        ],
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
