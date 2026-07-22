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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
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
          .signIn(
            email: _emailController.text,
            password: _passwordController.text,
          );
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
      title: 'Welcome back',
      subtitle: 'Your Korean adventure, all in one calm place.',
      footer: TextButton(
        onPressed: _isLoading ? null : () => context.go('/register'),
        child: const Text('New here? Create your account'),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthTextField(
              controller: _emailController,
              label: 'Email address',
              validator: AuthValidators.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSpacing.md),
            AuthTextField(
              controller: _passwordController,
              label: 'Password',
              validator: AuthValidators.password,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _isLoading
                    ? null
                    : () => context.go('/forgot-password'),
                child: const Text('Forgot password?'),
              ),
            ),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: const TextStyle(color: AppColors.error),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            AppPrimaryButton(
              label: 'Sign in',
              onPressed: _signIn,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
