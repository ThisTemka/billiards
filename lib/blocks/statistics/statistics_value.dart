import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class StatisticsValue extends ConsumerWidget {
  final String title;
  final double value;
  final String Function(double) format;
  final bool isAnimated;

  const StatisticsValue({
    super.key,
    required this.title,
    required this.value,
    required this.format,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          format(value),
          style: theme.textStyles.titleLarge.copyWith(
            color: theme.colors.primaryText,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: theme.textStyles.bodyMedium.copyWith(
            color: theme.colors.secondaryText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

    if (isAnimated) {
      return content.animate().fadeIn().scale();
    }

    return content;
  }
}
