import 'package:aichatbot/common/helper/firebase_otpions.dart';
import 'package:aichatbot/common/netwrok/api_constants.dart';
import 'package:aichatbot/common/netwrok/api_service.dart';
import 'package:aichatbot/common/provider/auth_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aichatbot/features/chat/data/chat_repositoy.dart';
import 'package:aichatbot/features/chat/logic/chat_bloc.dart';
import 'package:aichatbot/common/provider/language.dart';
import 'package:aichatbot/common/provider/theme.dart';
import 'package:aichatbot/common/routing/app_router.dart';
import 'package:aichatbot/features/login/data/auth_repo.dart';
import 'package:aichatbot/features/login/logic/auth_bloc.dart';

import 'ai_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  const String baseUrl = ApiConstants.apiBaseUrl;

  final apiService = ApiService(baseUrl: baseUrl);
  final chatRepository = ChatRepository(apiService);
  final authRepository = AuthRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        Provider.value(value: apiService),
        Provider.value(value: chatRepository),
        Provider.value(value: authRepository),
        BlocProvider(create: (context) => ChatBloc(chatRepository)),
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
        Provider<FirebaseAnalytics>.value(value: FirebaseAnalytics.instance),
      ],
      child: AiApp(appRouter: AppRouter()),
    ),
  );
}
