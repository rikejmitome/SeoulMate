import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ContextScreen extends StatelessWidget {
  const ContextScreen({
    required this.title,
    required this.icon,
    required this.message,
    super.key,
  });
  final String title;
  final IconData icon;
  final String message;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.seoulBlue, size: AppSpacing.xxl),
            const SizedBox(height: AppSpacing.md),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    ),
  );
}
