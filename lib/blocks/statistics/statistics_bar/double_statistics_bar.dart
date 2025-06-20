import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/blocks/statistics/statistics_bar/statistics_bar_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoubleStatisticsBar extends ConsumerWidget {
  final String title;
  final String Function(double) format;
  final bool isLessBetter;
  final double firstValue;
  final double secondValue;

  const DoubleStatisticsBar({
    super.key,
    required this.title,
    required this.format,
    required this.isLessBetter,
    required this.firstValue,
    required this.secondValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    final maxValue = firstValue > secondValue ? firstValue : secondValue;
    final minValue = firstValue < secondValue ? firstValue : secondValue;

    final firstPercent = isLessBetter
        ? (firstValue > 0 ? minValue / firstValue : 1.0)
        : (maxValue > 0 ? firstValue / maxValue : 1.0);
    final secondPercent = isLessBetter
        ? (secondValue > 0 ? minValue / secondValue : 1.0)
        : (maxValue > 0 ? secondValue / maxValue : 1.0);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Text(
            title,
            style: theme.textStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              StatisticsBar(
                format: format,
                value: firstValue,
                percent: firstPercent,
                isReverse: true,
              ),
              SizedBox(width: 8.w),
              StatisticsBar(
                format: format,
                value: secondValue,
                percent: secondPercent,
                isReverse: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
