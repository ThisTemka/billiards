import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class SectionHeader extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final bool isAnimated;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: theme.textStyles.headlineLarge.copyWith(
                      color: theme.colors.primaryText,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 8.h),
                    Text(
                      subtitle!.tr,
                      style: theme.textStyles.bodyLarge.copyWith(
                        color: theme.colors.secondaryText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ],
    );

    if (isAnimated) {
      return content.animate().fadeIn().slideX();
    }

    return content;
  }
}
