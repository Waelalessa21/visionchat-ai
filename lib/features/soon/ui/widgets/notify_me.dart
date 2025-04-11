import 'dart:math' as math;

import 'package:aichatbot/common/widgets/popup/message_popup.dart';
import 'package:aichatbot/features/soon/ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WaitingScreenSignupForm extends StatefulWidget {
  const WaitingScreenSignupForm({super.key});

  @override
  State<WaitingScreenSignupForm> createState() =>
      _WaitingScreenSignupFormState();
}

class _WaitingScreenSignupFormState extends State<WaitingScreenSignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });

          final l10n = AppLocalizations.of(context)!;
          showToastMessage(
            context,
            l10n.great,
            "assets/icons/startup.png",
            isError: false,
          );

          _emailController.clear();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      constraints: BoxConstraints(
        maxWidth: ResponsiveHelper.size(
          context,
          math.min(500, screenWidth * 0.5),
          math.min(450, screenWidth * 0.75),
          screenWidth * 0.95,
        ),
      ),
      padding: EdgeInsets.all(ResponsiveHelper.size(context, 24, 20, 16)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            l10n.notifytitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: ResponsiveHelper.fontSize(context, 18, 17, 16),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ResponsiveHelper.size(context, 16, 14, 12)),
          Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 400) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'wael@example.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: ResponsiveHelper.size(
                                context,
                                16,
                                14,
                                12,
                              ),
                            ),
                            errorStyle: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                12,
                                11,
                                10,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseEnterEmail;
                            }
                            if (!_isValidEmail(value)) {
                              return l10n.pleaseEnterValidEmail;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.size(
                              context,
                              24,
                              20,
                              16,
                            ),
                            vertical: ResponsiveHelper.size(
                              context,
                              16,
                              14,
                              12,
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          disabledBackgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.6),
                        ),
                        child:
                            _isSubmitting
                                ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                )
                                : Text(l10n.notify),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'wael@example.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: ResponsiveHelper.size(
                              context,
                              16,
                              14,
                              12,
                            ),
                          ),
                          errorStyle: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              12,
                              11,
                              10,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.pleaseEnterEmail;
                          }
                          if (!_isValidEmail(value)) {
                            return l10n.pleaseEnterValidEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: ResponsiveHelper.size(
                              context,
                              16,
                              14,
                              12,
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          disabledBackgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.6),
                        ),
                        child:
                            _isSubmitting
                                ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                )
                                : Text(l10n.notify),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
