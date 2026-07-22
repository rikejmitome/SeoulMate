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

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
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
          .register(
            displayName: _nameController.text,
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
      title: 'Start your journey',
      subtitle: 'Create your private place for the Korea adventure.',
      footer: TextButton(
        onPressed: _isLoading ? null : () => context.go('/login'),
        child: const Text('Already have an account? Sign in'),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthTextField(
              controller: _nameController,
              label: 'Display name',
              validator: AuthValidators.displayName,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSpacing.md),
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
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSpacing.md),
            AuthTextField(
              controller: _confirmationController,
              label: 'Confirm password',
              validator: (value) => AuthValidators.passwordConfirmation(
                value,
                _passwordController.text,
              ),
              obscureText: true,
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
              label: 'Create account',
              onPressed: _register,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
