import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageAction extends ConsumerWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isLast;

  const PageAction({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: isLast ? 0 : 8.w),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colors.primaryButton,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: theme.borders.buttonRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: theme.colors.accentText, size: 14.w),
              SizedBox(width: 2.w),
              Text(
                label,
                style: theme.textStyles.buttonText.copyWith(fontSize: 11.sp),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ).animate().fadeIn().scale(),
      ),
    );
  }
}
