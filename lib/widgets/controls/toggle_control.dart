import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleControl extends ConsumerWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onToggle;

  const ToggleControl({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: 24.w,
            color: isSelected
                ? theme.colors.primaryAccent
                : theme.colors.secondaryText,
          ),
          onPressed: onToggle,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: theme.textStyles.bodySmall,
        ),
      ],
    );
  }
}
