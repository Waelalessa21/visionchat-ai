import 'package:aichatbot/common/layout/responsive.dart';
import 'package:aichatbot/common/provider/auth_provider.dart';
import 'package:aichatbot/common/widgets/components/text_and_icon.dart';
import 'package:aichatbot/common/widgets/header/mobile_header.dart';
import 'package:aichatbot/features/login/ui/widgets/auth_header.dart';
import 'package:aichatbot/common/widgets/header/desktop_header.dart';
import 'package:aichatbot/features/login/ui/widgets/login_form.dart';
import 'package:aichatbot/features/login/ui/widgets/register_form.dart';
import 'package:aichatbot/features/login/ui/widgets/tab_bar.dart';
import 'package:aichatbot/features/onBoarding/logic/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });

        context.read<AuthProvider>().setCurrentTab(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive(
                  mobile: const MobileHeader(),
                  desktop: const DesktopHeader(),
                ),
                SizedBox(height: 60),

                AuthHeader(),
                SizedBox(height: 30),

                AuthTabBar(tabController: _tabController),
                SizedBox(height: isDesktop ? 15 : 10.h),

                SizedBox(
                  width:
                      isDesktop
                          ? MediaQuery.of(context).size.width * 0.4
                          : MediaQuery.of(context).size.width * 0.8,
                  child:
                      _currentTabIndex == 0
                          ? Column(
                            children: [
                              const LoginForm(),
                              SizedBox(),
                              TextAndIcon(),
                            ],
                          )
                          : const RegisterForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
