import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class SelectorItem extends ConsumerWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectorItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    return InkWell(
      onTap: onTap,
      borderRadius: theme.borders.primaryRadius,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: theme.textStyles.bodyMedium,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: theme.colors.primaryAccent,
                size: 24.w,
              ),
          ],
        ),
      ),
    );
  }
}
