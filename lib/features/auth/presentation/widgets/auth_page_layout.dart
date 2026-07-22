import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AuthPageLayout extends StatelessWidget {
  const AuthPageLayout({
    required this.title,
    required this.subtitle,
    required this.child,
    this.footer,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  Text('SeoulMate', style: textTheme.displaySmall),
                  const SizedBox(height: AppSpacing.sm),
                  Text(subtitle, style: textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.xxl),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(title, style: textTheme.headlineSmall),
                          const SizedBox(height: AppSpacing.lg),
                          child,
                        ],
                      ),
                    ),
                  ),
                  if (footer != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    footer!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
