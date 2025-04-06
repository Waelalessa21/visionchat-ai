import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileInterestGrid extends StatelessWidget {
  const MobileInterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 6.h,
          crossAxisSpacing: 6.w,
          childAspectRatio: 3.0,
          children: [
            interestItem(context, provider, l10n.restaurants, Icons.restaurant),
            interestItem(
              context,
              provider,
              l10n.heritageSites,
              Icons.account_balance,
            ),
            interestItem(context, provider, l10n.adventures, Icons.terrain),
            interestItem(context, provider, l10n.accommodation, Icons.hotel),
            interestItem(context, provider, l10n.shopping, Icons.shopping_bag),
            interestItem(context, provider, l10n.events, Icons.event),
          ],
        );
      },
    );
  }

  Widget interestItem(
    BuildContext context,
    OnboardingProvider provider,
    String interest,
    IconData icon,
  ) {
    final isSelected = provider.selectedInterests.contains(interest);
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color:
                        isSelected
                            ? theme.colorScheme.primary.withOpacity(0.3)
                            : theme.shadowColor.withOpacity(0.1),
                    blurRadius: isSelected ? 6 : 3,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color:
                      isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withOpacity(0.3),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () => provider.toggleInterest(interest),
                  child: Padding(
                    padding: EdgeInsets.all(6.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 14.sp,
                          color:
                              isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.primary,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            interest,
                            style: TextStyle(
                              fontSize: 9.sp,
                              color:
                                  isSelected
                                      ? theme.colorScheme.onPrimary
                                      : theme.colorScheme.onSurface,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DesktopInterestGrid extends StatelessWidget {
  const DesktopInterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = MediaQuery.of(context).size.width * 0.75;

    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 3.0,
            children: [
              interestItem(
                context,
                provider,
                l10n.restaurants,
                Icons.restaurant,
              ),
              interestItem(
                context,
                provider,
                l10n.heritageSites,
                Icons.account_balance,
              ),
              interestItem(context, provider, l10n.adventures, Icons.terrain),
              interestItem(context, provider, l10n.accommodation, Icons.hotel),
              interestItem(
                context,
                provider,
                l10n.shopping,
                Icons.shopping_bag,
              ),
              interestItem(context, provider, l10n.events, Icons.event),
            ],
          ),
        );
      },
    );
  }

  Widget interestItem(
    BuildContext context,
    OnboardingProvider provider,
    String interest,
    IconData icon,
  ) {
    final isSelected = provider.selectedInterests.contains(interest);
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color:
                        isSelected
                            ? theme.colorScheme.primary.withOpacity(0.3)
                            : theme.shadowColor.withOpacity(0.1),
                    blurRadius: isSelected ? 8 : 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color:
                      isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => provider.toggleInterest(interest),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 20,
                          color:
                              isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          interest,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                isSelected
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
