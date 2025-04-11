import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/widgets/header/mobile_header.dart';
import 'package:aichatbot/common/widgets/header/desktop_header.dart';
import 'package:aichatbot/features/soon/ui/widgets/content.dart';
import 'package:aichatbot/features/soon/ui/widgets/footer.dart';
import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Responsive(
                mobile: const MobileHeader(),
                desktop: const DesktopHeader(),
              ),

              SizedBox(height: ResponsiveHelper.size(context, 40, 30, 20)),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: WaitingScreenContent(pulseAnimation: _pulseAnimation),
                ),
              ),

              const WaitingScreenFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
