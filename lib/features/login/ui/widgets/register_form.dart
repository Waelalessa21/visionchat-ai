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

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _acceptTerms = false;
  String? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      setState(() {
        _isLoading = true;
      });

      context
          .read<AuthProvider>()
          .register(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            fullName: _nameController.text.trim(),
            gender: _selectedGender,
          )
          .then((success) {
            if (success) {
              final l10n = AppLocalizations.of(context)!;
              showToastMessage(
                context,
                l10n.accountcreatedsuccess,
                "assets/icons/startup.png",
                isError: false,
              );

              Future.delayed(const Duration(milliseconds: 500), () {
                context.pushNamed(Routes.chat);
              });
            }

            setState(() {
              _isLoading = false;
            });
          });
    } else if (!_acceptTerms) {
      final l10n = AppLocalizations.of(context)!;
      showToastMessage(
        context,
        l10n.pleaseAgreeToTerms,
        "assets/icons/exclamation.png",
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = Responsive.isDesktop(context);
    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);

    _selectedGender ??= l10n.male;

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
              l10n.fullName,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: l10n.enterFullName,
              controller: _nameController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseEnterFullName;
                }
                return null;
              },
            ),

            SizedBox(height: 10.h),

            Text(
              l10n.gender,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(4),
                color: theme.colorScheme.surface,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedGender,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: isDesktop ? 14 : 12.sp,
                  ),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedGender = value;
                      });
                    }
                  },
                  items:
                      [l10n.male, l10n.female].map<DropdownMenuItem<String>>((
                        String value,
                      ) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              l10n.email,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: l10n.emailExample,
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
                  return l10n.pleaseEnterValidEmail;
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
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseEnterPassword;
                }
                if (value.length < 8) {
                  return l10n.passwordMinLength;
                }
                return null;
              },
            ),

            SizedBox(height: 10.h),

            Text(
              l10n.confirmPassword,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop ? 18 : 11.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: l10n.reenterPassword,
              controller: _confirmPasswordController,
              obscureText: true,
              isPassword: true,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.pleaseConfirmPassword;
                }
                if (value != _passwordController.text) {
                  return l10n.passwordsDoNotMatch;
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

            SizedBox(height: 10.h),

            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    l10n.agreeToTerms,
                    style: TextStyle(fontSize: isDesktop ? 12 : 10.sp),
                  ),
                ),
              ],
            ),

            SizedBox(height: isDesktop ? 15 : 10.h),

            CustomButton(
              text: l10n.createAccount,
              onPressed: _handleRegister,
              isLoading: _isLoading || authProvider.isLoading,
            ),

            SizedBox(height: isDesktop ? 16 : 12.h),
          ],
        ),
      ),
    );
  }
}
