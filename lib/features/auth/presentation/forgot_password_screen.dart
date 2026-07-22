import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../domain/auth_validators.dart';
import 'auth_error_message.dart';
import 'auth_providers.dart';
import 'widgets/auth_page_layout.dart';
import 'widgets/auth_text_field.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  bool _isSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await ref
          .read(authRepositoryProvider)
          .sendPasswordResetEmail(_emailController.text);
      if (mounted) {
        setState(() => _isSent = true);
      }
    } catch (error) {
      if (mounted) {
        setState(() => _errorMessage = authErrorMessage(error));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: 'Reset your password',
      subtitle: 'We will send a calm little rescue link to your inbox.',
      footer: TextButton(
        onPressed: _isLoading ? null : () => context.go('/login'),
        child: const Text('Back to sign in'),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isSent)
              const Text(
                'Check your inbox for the password reset link.',
                style: TextStyle(color: AppColors.secondaryText),
              )
            else ...[
              AuthTextField(
                controller: _emailController,
                label: 'Email address',
                validator: AuthValidators.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: AppColors.error),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              AppPrimaryButton(
                label: 'Send reset link',
                onPressed: _sendResetLink,
                isLoading: _isLoading,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
