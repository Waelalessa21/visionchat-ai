import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:aichatbot/common/provider/language.dart';
import 'package:aichatbot/common/provider/theme.dart';
import 'package:aichatbot/common/routing/app_router.dart';
import 'package:aichatbot/common/routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AiApp extends StatelessWidget {
  final AppRouter appRouter;

  const AiApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Consumer2<ThemeProvider, LocaleProvider>(
          builder: (context, themeProvider, localeProvider, child) {
            final langCode = localeProvider.locale.languageCode;
            final fontFamily = langCode == 'ar' ? 'IBMPlexSansArabic' : 'Share';

            return MaterialApp(
              title: 'Vision',
              theme: themeProvider.getLightThemeWithFont(fontFamily),
              darkTheme: themeProvider.getDarkThemeWithFont(fontFamily),
              themeMode: themeProvider.themeMode,
              debugShowCheckedModeBanner: false,
              locale: localeProvider.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale('ar')],
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.onBoarding,
            );
          },
        );
      },
    );
  }
}
