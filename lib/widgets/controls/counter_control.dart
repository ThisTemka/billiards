import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterControl extends ConsumerWidget {
  final String label;
  final IconData icon;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterControl({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    return Column(
      children: [
        Icon(
          icon,
          size: 24.w,
          color: theme.colors.primaryAccent,
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: theme.textStyles.bodySmall,
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, size: 20.w),
              onPressed: onDecrement,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Text(
              value.toString(),
              style: theme.textStyles.titleMedium,
            ),
            IconButton(
              icon: Icon(Icons.add, size: 20.w),
              onPressed: onIncrement,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}
