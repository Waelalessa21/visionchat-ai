import 'package:aichatbot/common/routing/routes.dart';
import 'package:aichatbot/features/chat/ui/chat_screen.dart';
import 'package:aichatbot/features/login/ui/register_screen.dart';
import 'package:aichatbot/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:aichatbot/features/soon/ui/soon_screen.dart';
import 'package:flutter/material.dart';

///Class to handle routing in the app.
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      case Routes.waiting:
        return MaterialPageRoute(builder: (_) => const WaitingScreen());

      default:
        return null;
    }
  }
}
