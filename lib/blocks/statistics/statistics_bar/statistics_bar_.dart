import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/widgets/bar/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsBar extends ConsumerWidget {
  final String? title;
  final String Function(double) format;
  final double value;
  final double percent;
  final bool isReverse;

  const StatisticsBar({
    super.key,
    required this.format,
    this.title,
    required this.value,
    required this.percent,
    this.isReverse = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          if (title != null)
            Text(
              title!,
              style: theme.textStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  format(value),
                  style: theme.textStyles.statValue,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          BarWidget(
            value: percent,
            isReverse: isReverse,
          ),
        ],
      ),
    );
  }
}
