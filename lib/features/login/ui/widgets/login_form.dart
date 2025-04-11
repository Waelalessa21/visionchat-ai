import 'package:aichatbot/common/helper/extenstion.dart';
import 'package:aichatbot/common/provider/auth_provider.dart';
import 'package:aichatbot/common/routing/routes.dart';
import 'package:aichatbot/common/widgets/buttons/app_button.dart';
import 'package:aichatbot/common/widgets/fields/app_textfield.dart';
import 'package:aichatbot/common/widgets/popup/message_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aichatbot/common/layout/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      context
          .read<AuthProvider>()
          .login(_emailController.text.trim(), _passwordController.text)
          .then((success) {
            if (success) {
              final l10n = AppLocalizations.of(context)!;
              showToastMessage(
                context,
                l10n.loginSuccessful,
                "assets/icons/startup.png",
                isError: false,
              );

              Future.delayed(const Duration(milliseconds: 500), () {
                context.pushNamed(Routes.waiting);
              });
            } else if (context.read<AuthProvider>().errorMessage != null) {
              showToastMessage(
                context,
                context.read<AuthProvider>().errorMessage!,
                "assets/icons/exclamation.png",
                isError: true,
              );
            }

            setState(() {
              _isLoading = false;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = Responsive.isDesktop(context);
    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 20 : 15,
        horizontal: 10,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.email,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: 'your.email@example.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseEnterEmail;
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return l10n.pleaseEnterEmail;
                }
                return null;
              },
            ),

            SizedBox(height: 10.h),

            Text(
              l10n.password,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: l10n.enterPassword,
              controller: _passwordController,
              obscureText: true,
              isPassword: true,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.enterPassword;
                }
                return null;
              },
            ),

            SizedBox(height: 8.h),

            if (authProvider.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  authProvider.errorMessage!,
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: isDesktop ? 14 : 10.sp,
                  ),
                ),
              ),

            SizedBox(height: isDesktop ? 15 : 10.h),

            CustomButton(
              text: l10n.signIn,
              onPressed: _handleLogin,
              isLoading: _isLoading || authProvider.isLoading,
            ),

            SizedBox(height: isDesktop ? 16 : 12.h),
          ],
        ),
      ),
    );
  }
}
