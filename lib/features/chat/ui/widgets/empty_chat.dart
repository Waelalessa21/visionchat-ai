import 'package:aichatbot/common/widgets/components/empty_chat_component.dart';
import 'package:flutter/material.dart';
import 'package:aichatbot/common/layout/responsive.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LandingView(isDesktop: false),
      desktop: LandingView(isDesktop: true),
    );
  }
}
